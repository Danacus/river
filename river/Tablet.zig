// This file is part of river, a dynamic tiling wayland compositor.
//
// Copyright 2020 The River Developers
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

const Self = @This();

const std = @import("std");
const wlr = @import("wlroots");
const wl = @import("wayland").server.wl;

const Seat = @import("Seat.zig");

const log = std.log.scoped(.tablet);

seat: *Seat,
input_device: *wlr.InputDevice,
tablet: *wlr.TabletV2,

pub fn init(self: *Self, manager: *wlr.TabletManagerV2, seat: *Seat, input_device: *wlr.InputDevice) !void {
    self.* = .{
        .seat = seat,
        .input_device = input_device,
        .tablet = wlr.TabletV2.create(manager, seat, input_device),
    };
}
