accessing
announcer
	^ guixAnnouncer ifNil: [ guixAnnouncer := Announcer new ]