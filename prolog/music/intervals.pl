:- module(intervals,
        [ semitones/3,              % ?Note1, ?Note2, ?Semitones
          interval/3,               % ?Note1, ?Note2, ?Interval
          diminished_unison/2,      % ?Note1, ?Note2
          perfect_unison/2,         % ?Note1, ?Note2
          augmented_unison/2,       % ?Note1, ?Note2
          diminished_second/2,      % ?Note1, ?Note2
          minor_second/2,           % ?Note1, ?Note2
          major_second/2,           % ?Note1, ?Note2
          augmented_second/2,       % ?Note1, ?Note2
          diminished_third/2,       % ?Note1, ?Note2
          minor_third/2,            % ?Note1, ?Note2
          major_third/2,            % ?Note1, ?Note2
          augmented_third/2,        % ?Note1, ?Note2
          diminished_fourth/2,      % ?Note1, ?Note2
          perfect_fourth/2,         % ?Note1, ?Note2
          augmented_fourth/2,       % ?Note1, ?Note2
          diminished_fifth/2,       % ?Note1, ?Note2
          perfect_fifth/2,          % ?Note1, ?Note2
          augmented_fifth/2,        % ?Note1, ?Note2
          diminished_sixth/2,       % ?Note1, ?Note2
          minor_sixth/2,            % ?Note1, ?Note2
          major_sixth/2,            % ?Note1, ?Note2
          augmented_sixth/2,        % ?Note1, ?Note2
          diminished_seventh/2,     % ?Note1, ?Note2
          minor_seventh/2,          % ?Note1, ?Note2
          major_seventh/2,          % ?Note1, ?Note2
          augmented_seventh/2,      % ?Note1, ?Note2
          diminished_octave/2,      % ?Note1, ?Note2
          perfect_octave/2,         % ?Note1, ?Note2
          augmented_octave/2        % ?Note1, ?Note2
        ]).

:- use_module('notes.pl').


%!  semitones(?Note1, ?Note2, ?Semitones)
%!  semitones(?Pitch1, ?Pitch2, ?Semitones)
%
%   Calculate the number of semitones between Note1/Pitch1 and Note2/Pitch2.
%   Note2 is assumed to be higher than Note1. Pitch2 may be higher or lower
%   than Pitch1. E.g.
%
%   ==
%       semitones('C', 'A', 9).
%       semitones('C4', A3', -3).
%   ==

semitones(N1, N2, S) :-
    note(N1, P1, _),
    note(N2, P2, _),
    S is (P2 - P1) mod 12.

semitones(P1, P2, S) :-
    pitch(P1, _, _),
    pitch(P2, _, _),
    midi_note(N1, P1),
    midi_note(N2, P2),
    S is N2 - N1.


%!  interval(?Note1, ?Note2, ?Interval)
%
%   Calculate the interval between Note1 and Note2 in terms of letter names
%   or the number of spaces and lines between the notes on a staff.
%   By convention, Note2 is assumed to be higher than Note1.

interval(N1, N2, I) :-
    note(N1, _, L1),
    note(N2, _, L2),
    I is (L2 - L1) mod 7.


%!  diminished_unison(?Note1, ?Note2)
%
%   True if Note2 is a diminished unison above(?) Note1.

diminished_unison(N1, N2) :-
    semitones(N1, N2, -1),
    interval(N1, N2, 0).


%!  perfect_unison(?Note1, ?Note2)
%
%   True if Note2 is a perfect unison above(?) N1.

perfect_unison(N, N) :-
    note(N, _, _).


%!  augmented_unison(?Note1, ?Note2)
%
%   True if Note2 is an augmented unison above Note1.

augmented_unison(N1, N2) :-
    semitones(N1, N2, 1),
    interval(N1, N2, 0).


%!  diminished_second(?Note1, ?Note2)
%
%   True if Note2 is a diminished second above Note1.

diminished_second(N1, N2) :-
    semitones(N1, N2, 0),
    interval(N1, N2, 1).


%!  minor_third(?Note1, ?Note2)
%
%   True if Note2 is a minor third above Note1.

minor_second(N1, N2) :-
    semitones(N1, N2, 1),
    interval(N1, N2, 1).


%!  major_second(?Note1, ?Note2)
%
%   True if Note2 is a major second above Note1.

major_second(N1, N2) :-
    semitones(N1, N2, 2),
    interval(N1, N2, 1).


%!  augmented_second(?Note1, ?Note2)
%
%   True if Note2 is an augmented second above Note1.

augmented_second(N1, N2) :-
    semitones(N1, N2, 3),
    interval(N1, N2, 1).


%!  diminished_third(?Note1, ?Note2)
%
%   True if Note2 is a diminished third above Note1.

diminished_third(N1, N2) :-
    semitones(N1, N2, 2),
    interval(N1, N2, 2).


%!  minor_third(?Note1, ?Note2)
%
%   True if Note2 is a minor third above Note1.

minor_third(N1, N2) :-
    semitones(N1, N2, 3),
    interval(N1, N2, 2).


%!  major_third(?Note1, ?Note2)
%
%   True if Note2 is a major third above Note1.

major_third(N1, N2) :-
    semitones(N1, N2, 4),
    interval(N1, N2, 2).


%!  augmented_third(?Note1, ?Note2)
%
%   True if Note2 is an augmented third above Note1.

augmented_third(N1, N2) :-
    semitones(N1, N2, 5),
    interval(N1, N2, 2).


%!  diminished_fourth(?Note1, ?Note2)
%
%   True if Note2 is a diminished fourth above Note1.

diminished_fourth(N1, N2) :-
    semitones(N1, N2, 4),
    interval(N1, N2, 3).


%!  perfect_fourth(?Note1, ?Note2)
%
%   True if Note2 is a perfect fourth above Note1.

perfect_fourth(N1, N2) :-
    semitones(N1, N2, 5),
    interval(N1, N2, 3).


%!  augmented_fourth(?Note1, ?Note2)
%
%   True if Note2 is an augmented fourth above Note1.

augmented_fourth(N1, N2) :-
    semitones(N1, N2, 6),
    interval(N1, N2, 3).


%!  diminished_fifth(?Note1, ?Note2)
%
%   True if Note2 is a diminished fifth above Note1.

diminished_fifth(N1, N2) :-
    semitones(N1, N2, 6),
    interval(N1, N2, 4).


%!  perfect_fifth(?Note1, ?Note2)
%
%   True if Note2 is a perfect fifth above Note1.

perfect_fifth(N1, N2) :-
    semitones(N1, N2, 7),
    interval(N1, N2, 4).


%!  augmented_fifth(?Note1, ?Note2)
%
%   True if Note2 is an augmented fifth above Note1.

augmented_fifth(N1, N2) :-
    semitones(N1, N2, 8),
    interval(N1, N2, 4).


%!  tritone(?Note1, ?Note2)
%
%   True if Note2 is a tritone above Note1.

tritone(N1, N2) :- augmented_fourth(N1, N2).
tritone(N1, N2) :- diminished_fifth(N1, N2).


%!  diminished_sixth(?Note1, ?Note2)
%
%   True if Note2 is a diminished sixth above Note1.

diminished_sixth(N1, N2) :-
    semitones(N1, N2, 7),
    interval(N1, N2, 5).


%!  minor_sixth(?Note1, ?Note2)
%
%   True if Note2 is a minor sixth above Note1.

minor_sixth(N1, N2) :-
    semitones(N1, N2, 8),
    interval(N1, N2, 5).


%!  major_sixth(?Note1, ?Note2)
%
%   True if Note2 is a major sixth above Note1.

major_sixth(N1, N2) :-
    semitones(N1, N2, 9),
    interval(N1, N2, 5).


%!  augmented_sixth(?Note1, ?Note2)
%
%   True if Note2 is an augmented sixth above Note1.

augmented_sixth(N1, N2) :-
    semitones(N1, N2, 10),
    interval(N1, N2, 5).


%!  diminished_seventh(?Note1, ?Note2)
%
%   True if Note2 is a diminished seventh above Note1.

diminished_seventh(N1, N2) :-
    semitones(N1, N2, 9),
    interval(N1, N2, 6).


%!  minor_seventh(?Note1, ?Note2)
%
%   True if Note2 is a minor seventh above Note1.

minor_seventh(N1, N2) :-
    semitones(N1, N2, 10),
    interval(N1, N2, 6).


%!  major_seventh(?Note1, ?Note2)
%
%   True if Note2 is a major seventh above Note1.

major_seventh(N1, N2) :-
    semitones(N1, N2, 11),
    interval(N1, N2, 6).


%!  augmented_seventh(?Note1, ?Note2)
%
%   True if Note2 is an augmented seventh above Note1.

augmented_seventh(N1, N2) :-
    semitones(N1, N2, 12),
    interval(N1, N2, 6).


%!  diminished_octave(?Note1, ?Note2)
%
%   True if Note2 is a diminished octave above Note1.

diminished_octave(N1, N2) :-
    semitones(N1, N2, 11),
    interval(N1, N2, 7).


%!  perfect_octave(?Note1, ?Note2)
%
%   True if Note2 is a perfect octave above Note1.

perfect_octave(N1, N2) :-
    semitones(N1, N2, 12),
    interval(N1, N2, 7).


%!  augmented_octave(?Note1, ?Note2)
%
%   True if Note2 is an augmented octave above Note1.

augmented_octave(N1, N2) :-
    semitones(N1, N2, 13),
    interval(N1, N2, 7).
