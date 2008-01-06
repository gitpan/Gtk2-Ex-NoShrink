#!/usr/bin/perl

# Copyright 2007 Kevin Ryde

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

use ExtUtils::MakeMaker;

WriteMakefile
    (NAME         => 'Gtk2::Ex::NoShrink',
     ABSTRACT     => 'Non-shrinking container widget for Gtk.',
     VERSION_FROM => 'lib/Gtk2/Ex/NoShrink.pm',
     AUTHOR       => 'Kevin Ryde <user42@zip.com.au>',
     LICENSE      => 'gpl',
     SIGN         => 1,
     PREREQ_PM    => { Gtk2 => 0 }, # any version should be ok
     clean        => { FILES => "NoShrink.html" },
    );

sub MY::postamble {
    return <<'MAKE_FRAG';

lint:
	perl -MO=Lint lib/Gtk2/Ex/NoShrink.pm
	podchecker lib/Gtk2/Ex/NoShrink.pm

myman:
	rm -f MANIFEST
	touch SIGNATURE
	make manifest

NoShrink.html: lib/Gtk2/Ex/NoShrink.pm Makefile
	-perl -MPod::Simple::HTML -e Pod::Simple::HTML::go \
	  lib/Gtk2/Ex/NoShrink.pm >NoShrink.html

MAKE_FRAG
}
