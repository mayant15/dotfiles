const std = @import("std");

const STEP = 0.05; // increase/decrease in brightness

const MAX_BRIGHTNESS_FILE = "/sys/class/backlight/nvidia_wmi_ec_backlight/max_brightness";
const BRIGHTNESS_FILE = "/sys/class/backlight/nvidia_wmi_ec_backlight/brightness";

fn fs_read_usize(path: []const u8) !usize {
    var file = try std.fs.openFileAbsolute(path, .{});
    var buf: [64]u8 = undefined;
    const len = try file.readAll(&buf);
    return std.fmt.parseInt(usize, buf[0..(len - 1)], 10);
}

fn fs_write_usize(path: []const u8, val: usize) !void {
    var file = try std.fs.openFileAbsolute(path, .{ .mode = .write_only });
    return std.fmt.formatInt(val, 10, .lower, .{}, file.writer());
}

fn clamp(val: anytype, min: @TypeOf(val), max: @TypeOf(val)) @TypeOf(val) {
    return if (val > max) max else if (val < min) min else val;
}

fn calc_next(current: usize, max: usize, step: f32) usize {
    const max_float: f32 = @floatFromInt(max);
    const current_float: f32 = @floatFromInt(current);
    const diff: f32 = max_float * step;
    const next: usize = @intFromFloat(@floor(current_float + diff));
    return clamp(next, 0, max);
}

pub fn main() !void {
    var args = std.process.args();
    _ = args.next();

    if (args.next()) |action| {
        if (action[0] == '+') {
            const max = try fs_read_usize(MAX_BRIGHTNESS_FILE);
            const current = try fs_read_usize(BRIGHTNESS_FILE);
            const next = calc_next(current, max, STEP);
            try fs_write_usize(BRIGHTNESS_FILE, next);
        } else if (action[0] == '-') {
            const max = try fs_read_usize(MAX_BRIGHTNESS_FILE);
            const current = try fs_read_usize(BRIGHTNESS_FILE);
            const next = calc_next(current, max, -1.0 * STEP);
            try fs_write_usize(BRIGHTNESS_FILE, next);
        } else {
            @panic("invalid arguments. Expected '+' or '-'");
        }
    }
}
