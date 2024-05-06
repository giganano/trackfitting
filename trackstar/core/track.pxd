# cython: language_level = 3, boundscheck = False
#
# This file is part of the TrackStar package.
# Copyright (C) 2023 James W. Johnson (giganano9@gmail.com)
# License: MIT License. See LICENSE in top-level directory
# at: https://github.com/giganano/trackstar.git.

from .matrix cimport MATRIX

cdef extern from "./src/track.h":
	ctypedef struct TRACK:
		double **predictions
		unsigned short n_rows
		unsigned short n_cols
		unsigned short n_threads
		char **labels
		double *weights
		unsigned short use_line_segment_corrections
		double line_segment_correction_tolerance
		unsigned short line_segment_correction_flag

	TRACK *track_initialize(double **predictions, char **labels,
		double *weights, unsigned short n_vectors, unsigned short dim)
	void track_free(TRACK *t)


cdef class track:
	cdef MATRIX *_m
	cdef TRACK *_t
