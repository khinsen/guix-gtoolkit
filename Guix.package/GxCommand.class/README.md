A convenience wrapper around ${class:name=GxSubprocess}$ for running a command while capturing its output. Assumes that the output is small enough to be stored in memory. See ${class:name=GtUnixSubprocess}$ for details.

Instances are generated via ${method:name=GxEnvironment>>#command:arguments:}$. Example:
[[[
env := GxEnvironment.
proc := env command: 'hello' arguments: #().
proc runAndWait.
proc
]]]
