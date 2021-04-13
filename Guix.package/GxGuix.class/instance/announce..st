accessing
announce: anAnnouncement
	announcer announce: anAnnouncement.
	(GxSignal on: anAnnouncement) emit.