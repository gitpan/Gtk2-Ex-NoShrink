# Copyright 2007, 2008 Kevin Ryde

# This file is part of Gtk2::Ex::NoShrink.
#
# Gtk2::Ex::NoShrink is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3, or (at your option) any later
# version.
#
# Gtk2::Ex::NoShrink is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License along
# with Gtk2::Ex::NoShrink.  If not, see <http://www.gnu.org/licenses/>.


use Test::More tests => 4;

use Gtk2;
use Gtk2::Ex::NoShrink;
use Scalar::Util;

ok ($Gtk2::Ex::NoShrink::VERSION >= 1);

my $init = Gtk2->init_check;

SKIP: {
  if (! $init) { skip 'due to no DISPLAY available', 3; }

  {
    my $noshrink = Gtk2::Ex::NoShrink->new;
    Scalar::Util::weaken ($noshrink);
    is ('not defined', defined $noshrink ? 'defined' : 'not defined',
        'garbage collected when weakened, when empty');
  }

  {
    my $noshrink = Gtk2::Ex::NoShrink->new;
    my $label    = Gtk2::Label->new ('hello');
    $noshrink->add ($label);
    Scalar::Util::weaken ($label);
    Scalar::Util::weaken ($noshrink);

    is ('not defined', defined $noshrink ? 'defined' : 'not defined',
        'garbage collected when weakened, when not empty');
    is ('not defined', defined $label ? 'defined' : 'not defined',
        'content garbage collected when weakened');
  }
};

exit 0;
