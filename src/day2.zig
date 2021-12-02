const std = @import("std");

const input = @embedFile("../res/day2_input.txt");

const Command = enum {
    forward,
    up,
    down,
};

pub fn main() !void {
    const part1_answer = part1();
    std.log.info("Answer for part 1 = {d}", .{part1_answer});
    const part2_answer = part2();
    std.log.info("Answer for part 2 = {d}", .{part2_answer});
}

fn part1() !u32 {
    var it = std.mem.tokenize(u8, input, "\n");
    var horizontal: u32 = 0;
    var depth: u32 = 0;

    while (it.next()) |line| {
        var split_it = std.mem.split(u8, line, " ");
        var command_str = split_it.next().?;
        var value = try std.fmt.parseInt(u8, split_it.next().?, 10);
        var command = std.meta.stringToEnum(Command, command_str).?;
        switch (command) {
            .forward => {
                horizontal += value;
            },
            .down => {
                depth += value;
            },
            .up => {
                depth -= value;
            },
        }
    }
    return depth * horizontal;
}

fn part2() !u32 {
    var it = std.mem.tokenize(u8, input, "\n");
    var aim: u32 = 0;
    var horizontal: u32 = 0;
    var depth: u32 = 0;

    while (it.next()) |line| {
        var split_it = std.mem.split(u8, line, " ");
        var command_str = split_it.next().?;
        var value = try std.fmt.parseInt(u8, split_it.next().?, 10);
        var command = std.meta.stringToEnum(Command, command_str).?;
        switch (command) {
            .forward => {
                horizontal += value;
                depth += aim * value;
            },
            .down => {
                aim += value;
            },
            .up => {
                aim -= value;
            },
        }
    }
    return depth * horizontal;
}
