:- module(notes,
        [ diminished_chord/3,               % ?Root, ?Third, ?Fifth
          diminished_chord/4,               % ?Root, ?Third, ?Fifth, ?Notes
          minor_chord/3,                    % ?Root, ?Third, ?Fifth
          minor_chord/4,                    % ?Root, ?Third, ?Fifth, ?Notes
          major_chord/3,                    % ?Root, ?Third, ?Fifth
          major_chord/4,                    % ?Root, ?Third, ?Fifth, ?Notes
          augmented_chord/3,                % ?Root, ?Third, ?Fifth
          augmented_chord/4,                % ?Root, ?Third, ?Fifth, ?Notes
          diminished_seventh_chord/4,       % ?Root, ?Third, ?Fifth, ?Seventh
          diminished_seventh_chord/5,       % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          half_diminished_seventh_chord/4,  % ?Root, ?Third, ?Fifth, ?Seventh
          half_diminished_seventh_chord/5,  % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          minor_seventh_chord/4,            % ?Root, ?Third, ?Fifth, ?Seventh
          minor_seventh_chord/5,            % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          dominant_seventh_chord/4,         % ?Root, ?Third, ?Fifth, ?Seventh
          dominant_seventh_chord/5,         % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          major_seventh_chord/4,            % ?Root, ?Third, ?Fifth, ?Seventh
          major_seventh_chord/5,            % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          augmented_seventh_chord/4,        % ?Root, ?Third, ?Fifth, ?Seventh
          augmented_seventh_chord/5,        % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          augmented_major_seventh_chord/4,  % ?Root, ?Third, ?Fifth, ?Seventh
          augmented_major_seventh_chord/5,  % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes

          chord/2,                          % ?Symbol, ?Notes
          chord/4,                          % ?Root, ?Third, ?Fifth, ?Notes
          chord/5,                          % ?Root, ?Third, ?Fifth, ?Seventh, ?Notes
          root_position/2,                  % ?Bass, ?Notes
          first_inversion/2,                % ?Bass, ?Notes
          second_inversion/2,               % ?Bass, ?Notes
          third_inversion/2                 % ?Bass, ?Notes
        ]).

:- use_module('intervals.pl').
:- use_module('notes.pl').


%!  diminished_chord(?Root, ?Third, ?Fifth)
%
%   True if Root, Third, and Fifth form a diminished chord.

diminished_chord(Root, Third, Fifth) :-
    minor_third(Root, Third),
    diminished_fifth(Root, Fifth).


%!  diminished_chord(?Root, ?Third, ?Fifth, ?Notes)
%
%   True if Notes is list containing all of the notes in a diminished
%   chord. This predicate can be used to identify the different notes of
%   a chord (Root, Third, Fifth) from the list of notes.

diminished_chord(Root, Third, Fifth, Notes) :-
    diminished_chord(Root, Third, Fifth),
    permutation(Notes, [Root, Third, Fifth]).


%!  minor_chord(?Root, ?Third, ?Fifth)
%
%   True if Root, Third, and Fifth form a minor chord.

minor_chord(Root, Third, Fifth) :-
    minor_third(Root, Third),
    perfect_fifth(Root, Fifth).


%!  minor_chord(?Root, ?Third, ?Fifth, ?Notes)
%
%   True if Notes is list containing all of the notes in a minor
%   chord. This predicate can be used to identify the different notes of
%   a chord (Root, Third, Fifth).

minor_chord(Root, Third, Fifth, Notes) :-
    minor_chord(Root, Third, Fifth),
    permutation(Notes, [Root, Third, Fifth]).


%!  major_chord(?Root, ?Third, ?Fifth)
%
%   True if Root, Third, and Fifth form a major chord.

major_chord(Root, Third, Fifth) :-
    major_third(Root, Third),
    perfect_fifth(Root, Fifth).


%!  major_chord(?Root, ?Third, ?Fifth, ?Notes)
%
%   True if Notes is a list containing all of the notes in a major
%   chord. This predicate can be used to identify the different notes of
%   a chord (Root, Third, Fifth).

major_chord(Root, Third, Fifth, Notes) :-
    major_chord(Root, Third, Fifth),
    permutation(Notes, [Root, Third, Fifth]).


%!  augmented_chord(?Root, ?Third, ?Fifth)
%
%   True if Root, Third, and Fifth form an augmented chord.

augmented_chord(Root, Third, Fifth) :-
    major_third(Root, Third),
    augmented_fifth(Root, Fifth).


%!  augmented_chord(?Root, ?Third, ?Fifth, ?Notes)
%
%   True if Notes is a list containing all of the notes in an augmented
%   chord. This predicate can be used to identify the different notes of
%   a chord (Root, Third, Fifth).

augmented_chord(Root, Third, Fifth, Notes) :-
    augmented_chord(Root, Third, Fifth),
    permutation(Notes, [Root, Third, Fifth]).


%!  diminished_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form a diminished seventh chord.

diminished_seventh_chord(Root, Third, Fifth, Seventh) :-
    diminished_chord(Root, Third, Fifth),
    diminished_seventh(Root, Seventh).


%!  diminished_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in a diminished
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

diminished_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    diminished_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  half_diminished_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form a half diminished
%   seventh chord.

half_diminished_seventh_chord(Root, Third, Fifth, Seventh) :-
    diminished_chord(Root, Third, Fifth),
    minor_seventh(Root, Seventh).


%!  half_diminished_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in a half diminished
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

half_diminished_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    half_diminished_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  minor_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form a minor seventh chord.

minor_seventh_chord(Root, Third, Fifth, Seventh) :-
    minor_chord(Root, Third, Fifth),
    major_seventh(Root, Seventh).


%!  minor_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in a minor
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

minor_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    minor_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  dominant_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form a dominant seventh chord.

dominant_seventh_chord(Root, Third, Fifth, Seventh) :-
    major_chord(Root, Third, Fifth),
    minor_seventh(Root, Seventh).


%!  dominant_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in a dominant
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

dominant_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    dominant_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  major_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form a major seventh chord.

major_seventh_chord(Root, Third, Fifth, Seventh) :-
    major_chord(Root, Third, Fifth),
    major_seventh(Root, Seventh).


%!  major_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in a major
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

major_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    major_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  augmented_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form an augmented seventh chord.

augmented_seventh_chord(Root, Third, Fifth, Seventh) :-
    augmented_chord(Root, Third, Fifth),
    minor_seventh(Root, Seventh).


%!  augmented_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in an augmented
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

augmented_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    augmented_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  augmented_major_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh)
%
%   True if Root, Third, Fifth, and Seventh form an augmented major
%   seventh chord.

augmented_major_seventh_chord(Root, Third, Fifth, Seventh) :-
    augmented_chord(Root, Third, Fifth),
    major_seventh(Root, Seventh).


%!  augmented_major_seventh_chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a list containing all of the notes in an augmented major
%   seventh chord. This predicate can be used to identify the different
%   notes of a chord (Root, Third, Fifth, Seventh).

augmented_major_seventh_chord(Root, Third, Fifth, Seventh, Notes) :-
    augmented_major_seventh_chord(Root, Third, Fifth, Seventh),
    permutation(Notes, [Root, Third, Fifth, Seventh]).


%!  chord(?Symbol, ?Notes)
%
%   True if Notes is a list containing all of the notes in the chord
%   specified by the chord symbol, Symbol.

chord(Symbol, Notes) :-
    minor_chord(Root, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'm', Symbol)
    ;   string_concat(Note, 'min', Symbol)
    ;   string_concat(Note, '-', Symbol)
    ).

chord(Symbol, Notes) :-
    major_chord(Root, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'M', Symbol)
    ;   string_concat(Note, 'maj', Symbol)
    ).

chord(Symbol, Notes) :-
    diminished_chord(Root, _, _, Notes),
    atom_string(Root, Note),
    string_concat(Note, 'dim', Symbol).

chord(Symbol, Notes) :-
    augmented_chord(Root, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'aug', Symbol)
    ;   string_concat(Note, '+', Symbol)
    ).

chord(Symbol, Notes) :-
    diminished_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    string_concat(Note, 'dim7', Symbol).

chord(Symbol, Notes) :-
    half_diminished_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    string_concat(Note, 'm7b5', Symbol).

chord(Symbol, Notes) :-
    minor_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'm7', Symbol)
    ;   string_concat(Note, 'min7', Symbol)
    ;   string_concat(Note, '-7', Symbol)
    ).

chord(Symbol, Notes) :-
    dominant_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    string_concat(Note, '7', Symbol).

chord(Symbol, Notes) :-
    augmented_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'm+7', Symbol)
    ;   string_concat(Note, 'maug7', Symbol)
    ;   string_concat(Note, 'aug7', Symbol)
    ;   string_concat(Note, '7#5', Symbol)
    ;   string_concat(Note, '+7', Symbol)
    ).

chord(Symbol, Notes) :-
    augmented_major_seventh_chord(Root, _, _, _, Notes),
    atom_string(Root, Note),
    (   string_concat(Note, 'augM7', Symbol)
    ;   string_concat(Note, 'M7#5', Symbol)
    ;   string_concat(Note, '+M7', Symbol)
    ).


%!  chord(?Root, ?Third, ?Fifth, ?Notes)
%
%   True if Notes is a set containing all of the the notes of any triad.
%   This predicate can be used to identify the different notes of a chord
%   (Root, Third, Fifth).

chord(Root, Third, Fifth, Notes) :-
    (   diminished_chord(Root, Third, Fifth, Notes)
    ;   minor_chord(Root, Third, Fifth, Notes)
    ;   major_chord(Root, Third, Fifth, Notes)
    ;   augmented_chord(Root, Third, Fifth, Notes)
    ).


%!  chord(?Root, ?Third, ?Fifth, ?Seventh, ?Notes)
%
%   True if Notes is a set containing all of the the notes of any seventh
%   chord. This predicate can be used to identify the different notes of
%   a chord (Root, Third, Fifth, Seventh).

chord(Root, Third, Fifth, Seventh, Notes) :-
    (   diminished_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   half_diminished_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   minor_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   dominant_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   major_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   augmented_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ;   augmented_major_seventh_chord(Root, Third, Fifth, Seventh, Notes)
    ).


%!  root_position(?Bass, ?Notes)
%
%   True if Notes is a set of notes that compose a chord and if the Bass
%   note is the root note of that chord.

root_position(Bass, Notes) :-
    note(Bass, _, _),
    chord(Bass, _, _, Notes).

root_position(Bass, Notes) :-
    note(Bass, _, _),
    chord(Bass, _, _, _, Notes).


%!  first_inversion(?Bass, ?Notes)
%
%   True if Notes is a set of notes that compose a chord and if the Bass
%   note is the third of that chord.

first_inversion(Bass, Notes) :-
    note(Bass, _, _),
    chord(_, Bass, _, Notes).

first_inversion(Bass, Notes) :-
    note(Bass, _, _),
    chord(_, Bass, _, _, Notes).


%!  second_inversion(?Bass, ?Notes)
%
%   True if Notes is a set of notes that compose a chord and if the Bass
%   note is the fifth of that chord.

second_inversion(Bass, Notes) :-
    note(Bass, _, _),
    chord(_, _, Bass, Notes).

second_inversion(Bass, Notes) :-
    note(Bass, _, _),
    chord(_, _, Bass, _, Notes).


%!  third_inversion(?Bass, ?Notes)
%
%   True if Notes is a set of notes that compose a chord and if the Bass
%   note is the seventh of that chord.

third_inversion(Bass, Notes) :-
    note(Bass, _, _),
    chord(_, _, _, Bass, Notes).
