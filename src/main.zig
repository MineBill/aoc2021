const std = @import("std");
const _ = @import("day1.zig");
const today = @import("day2.zig");

pub fn main() anyerror!void {
    try today.main();
}
