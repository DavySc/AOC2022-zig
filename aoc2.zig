const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn solve(input: [:0]const u8) ![2]u32 {
    const lines = std.mem.bytesAsSlice([4]u8, input);
    var total_score_1: u32 = 0;
    var total_score_2: u32 = 0;
    for (lines) |line| {
        const opponent_move = line[0];
        const our_move = line[2];
        total_score_1 += 3 * ((our_move - opponent_move - 1) % 3) + our_move - 'X' + 1;
        total_score_2 += 3 * (our_move - 'X') + ((opponent_move + our_move - 1) % 3 + 1);
    }
    return .{ total_score_1, total_score_2 };
}

pub fn main() !void {
    const solution: [2]u32 = try solve(@embedFile("input2.txt"));
    const sol1 = solution[0];
    const sol2 = solution[1];
    try stdout.print("{d}, {d}\n", .{ sol1, sol2 });
}
