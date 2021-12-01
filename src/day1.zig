const std = @import("std");

const input = @embedFile("../res/day1_input.txt");

pub fn main() !void {
    const part1_answer = part1();
    std.log.info("Answer for part 1 = {d}", .{part1_answer});
    const part2_answer = part2();
    std.log.info("Answer for part 2 = {d}", .{part2_answer});
}

fn part1() !u16 {
    var it = std.mem.tokenize(u8, input, "\n");
    var count: u16 = 0;
    var previous_measurement: u16 = 0;
    while (it.next()) |line| {
        var measurement = try std.fmt.parseInt(u16, line, 10);
        if (measurement > previous_measurement) {
            count += 1;
        }
        previous_measurement = measurement;
    }
    return count - 1;
}

fn part2() !u16 {
    var it = std.mem.tokenize(u8, input, "\n");
    var numbers = std.ArrayList(u16).init(std.heap.page_allocator);
    while (it.next()) |line| {
        try numbers.append(try std.fmt.parseInt(u16, line, 10));
    }

    var count: u16 = 0;
    var previous_sum: u16 = 0;
    for (numbers.items) |_, index| {
        if (index == numbers.items.len - 2) break;

        var sum: u16 = 0;
        var i = index;
        while (i < index + 3) : (i += 1) {
            sum += numbers.items[i];
        }
        if (sum > previous_sum) {
            count += 1;
        }
        previous_sum = sum;
    }
    return count - 1;
}
