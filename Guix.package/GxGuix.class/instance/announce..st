accessing
announce: anAnnouncement
	self announcer announce: anAnnouncement.
	(GxSignal on: anAnnouncement) emit.