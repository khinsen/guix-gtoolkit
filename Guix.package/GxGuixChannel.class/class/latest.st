instance creation
latest
	"This is a quick hack to obtain the more recent commit on the Guix master branch.
	 It relies on the internals of a Git repository, and on its internals being
	 accessible via http. There is probably a cleaner way to do this via
	 LibGit."
	| latestCommitOnMaster |
	latestCommitOnMaster :=
		(ZnClient new
			url: self new url, '/refs/heads/master';
			get;
			response)
		entity contents allButLast asString.
	^ self commit: latestCommitOnMaster