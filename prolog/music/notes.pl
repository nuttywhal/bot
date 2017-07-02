:- module(notes,
        [ note/3,           % ?Note, ?Pitch, ?Letter
          pitch/3,          % ?SPN, ?Pitch, ?Octave
          midi_note/2       % ?Number, ?SPN
        ]).


%!  note(?Note, ?Pitch, ?Letter)
%
%   Relates a musical note name to its pitch class and its letter class.
%   A pitch class is a set of all notes that are enharmonically equivalent.
%   A letter class is a set of all note names that have the same letter
%   after removing all accidental modifiers (i.e. {Abb, Ab, A, A#, A##}).

note('Abb',  7, 5).
note('Ab',   8, 5).
note('A',    9, 5).
note('A#',  10, 5).
note('A##', 11, 5).

note('Bbb',  9, 6).
note('Bb',  10, 6).
note('B',   11, 6).
note('B#',   0, 6).
note('B##',  1, 6).

note('Cbb', 10, 0).
note('Cb',  11, 0).
note('C',    0, 0).
note('C#',   1, 0).
note('C##',  2, 0).

note('Dbb',  0, 1).
note('Db',   1, 1).
note('D',    2, 1).
note('D#',   3, 1).
note('D##',  4, 1).

note('Ebb',  2, 2).
note('Eb',   3, 2).
note('E',    4, 2).
note('E#',   5, 2).
note('E##',  6, 2).

note('Fbb',  3, 3).
note('Fb',   4, 3).
note('F',    5, 3).
note('F#',   6, 3).
note('F##',  7, 3).

note('Gbb',  5, 4).
note('Gb',   6, 4).
note('G',    7, 4).
note('G#',   8, 4).
note('G##',  9, 4).


%!  pitch(?SPN, ?Note, ?Octave)
%
%   Given the Scientific Pitch Notation (SPN) for a pitch, identify the Note
%   name and Octave number, and vise versa.

pitch(SPN, Note, Octave) :-
    note(Note, _, _),
    numlist(-1, 9, Octaves),
    member(Octave, Octaves),
    string_concat(Note, Octave, SPN).


%!  midi_note(?Number, ?SPN)
%
%   True if Number is a MIDI note number corresponding to the pitch represented
%   in Scientific Pitch Notation (SPN).

midi_note(Number, SPN) :-
    pitch(SPN, Note, Octave),
    note(Note, Pitch, _),
    Number is (Octave * 12) + Pitch + 12.
