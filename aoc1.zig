const std = @import("std");

pub fn updateMax(max: *[3]u32, current: u32) void {
    if (max[0] < current) {
        max[2] = max[1];
        max[1] = max[0];
        max[0] = current;
    } else if (max[1] < current) {
        max[2] = max[1];
        max[1] = current;
    } else if (max[2] < current) {
        max[2] = current;
    }
}
pub fn solve(input: [:0]const u8) ![3]u32 {
    var lines = std.mem.splitSequence(u8, input, "\n");
    var max: [3]u32 = .{ 0, 0, 0 };
    var current: u32 = 0;
    while (lines.next()) |line| {
        if (line.len == 0) {
            updateMax(&max, current);
            current = 0;
        } else {
            const line_num = try std.fmt.parseInt(u32, line, 10);
            current += line_num;
        }
    }
    return max;
}
pub fn main() !void {
    const vector = try solve(@embedFile("input.txt"));
    const max_1 = vector[0];
    const max_2 = @reduce(.Add, @as(@Vector(3, u32), vector));
    std.debug.print("solution 1: {d} \n solution 2: {d}\n", .{ max_1, max_2 });
}
