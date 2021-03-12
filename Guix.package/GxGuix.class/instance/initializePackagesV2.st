initialization
initializePackagesV2
	| packageData |
	packageData := self runReplCommand:
		'(fold-available-packages
(lambda* (name version result
                #:key outputs location
                supported? deprecated?
                #:allow-other-keys)
   (if (and supported? (not deprecated?))
     (let* ((package (name+version->package name version))
            (license-field (package-license package))
            (licenses (if (license? license-field)
                          (list license-field)
                          license-field)))
       (cons `((name . ,name)
               (version . ,version)
               (outputs . ,outputs)
               (location . ((file . ,(location-file location))
                            (line . ,(location-line location))
                            (column . ,(location-column location))))
               (supported . ,supported?)
               (deprecated . ,deprecated?)
               (synopsis . ,(package-synopsis package))
               (description . ,(package-description package))
               (licenses . ,(map license-name licenses))
               (home-page . ,(package-home-page package)))
             result))
     result))
 ''())'.
 	packages := packageData