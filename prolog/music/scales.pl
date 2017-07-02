:- module(scales,
        [ aeolean_mode/2,           % ?Tonic, ?Scale
          ionian_mode/2,            % ?Tonic, ?Scale
          harmonic_minor_mode/2,    % ?Tonic, ?Scale
          melodic_minor_mode/2,     % ?Tonic, ?Scale
          dorian_mode/2,            % ?Tonic, ?Scale
          phrygian_mode/2,          % ?Tonic, ?Scale
          lydian_mode/2,            % ?Tonic, ?Scale
          mixolydian_mode/2,        % ?Tonic, ?Scale
          locrian_mode/2            % ?Tonic, ?Scale
        ]).

:- use_module('intervals.pl').
:- use_module('notes.pl').


%!  aeolean_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of an
%   Aeolean scale in order with Tonic as the first scale degree.

aeolean_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    major_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    major_sixth(I, VI),
    major_seventh(I, VII).


%!  ionian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of an
%   Ionian scale in order with Tonic as the first scale degree.

ionian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    minor_sixth(I, VI),
    minor_seventh(I, VII).


%!  harmonic_minor_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   harmonic minor scale in order with Tonic as the first scale degree.

harmonic_minor_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    minor_sixth(I, VI),
    major_seventh(I, VII).


%!  melodic_minor_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of an ascending
%   melodic minor scale in order with Tonic as the first scale degree.

melodic_minor_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    major_sixth(I, VI),
    major_seventh(I, VII).


%!  dorian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   Dorian scale in order with Tonic as the first scale degree.

dorian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    major_sixth(I, VI),
    minor_seventh(I, VII).


%!  phrygian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   Phrygian scale in order with Tonic as the first scale degree.

phrygian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    minor_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    minor_sixth(I, VI),
    minor_seventh(I, VII).


%!  lydian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   Lydian scale in order with Tonic as the first scale degree.

lydian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    major_third(I, III),
    augmented_fourth(I, IV),
    perfect_fifth(I, V),
    major_sixth(I, VI),
    major_seventh(I, VII).


%!  mixolydian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   Mixolydian scale in order with Tonic as the first scale degree.

mixolydian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    major_second(I, II),
    major_third(I, III),
    perfect_fourth(I, IV),
    perfect_fifth(I, V),
    major_sixth(I, VI),
    minor_seventh(I, VII).


%!  locrian_mode(?Tonic, ?Scale)
%
%   True if Scale is a list containing the first seven notes of a
%   Locrian scale in order with Tonic as the first scale degree.

locrian_mode(I, [I, II, III, IV, V, VI, VII]) :-
    note(I, _, _),
    minor_second(I, II),
    minor_third(I, III),
    perfect_fourth(I, IV),
    diminished_fifth(I, V),
    minor_sixth(I, VI),
    minor_seventh(I, VII).
