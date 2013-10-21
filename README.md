xslt3testbed
============

Testbed for trying out XSLT 3.0 (http://www.w3.org/TR/xslt-30/) techniques.

Since few people have much (or any) experience using XSLT 3.0 on more than toy examples, this is a public, medium-sized XSLT 3.0 project where people could try out new XSLT 3.0 features on the transformations to (X)HTML(5) and XSL-FO that are what we do most often and, along the way, maybe come up with new design patterns for doing transformations using the higher-order functions, partial function application, and other goodies that XSLT 3.0 gives us.

## JATS Preview Stylesheets

This XSLT 3.0 testbed is based on the XSLT 1.0 "NISO Journal Article Tag Suite (JATS) version 1.0" stylesheets from https://github.com/NCBITools/JATSPreviewStylesheets

JATS is good project for this since:

- JATS is in wide use as the medium of exchange, and of archiving, for published scientific journal articles (and more)
- It has the Goldilocks factor of not being too large (it's not as large as DocBook or TEI) nor too small (it's also not a toy)
- There's lots of sample data available
- There's existing XSLT 1.0 stylesheets
- The existing stylesheets are in the public domain
- There's a quick win in just adding XSLT 2.0-isms to the XSLT 1.0 stylesheets

## Goals

- Trial - and make prior art for - different techniques for using XSLT 3.0
- Get an early start for developing the patterns and idioms for using XSLT 3.0 that many of us will be using for years to come
- Standalone XSLT 3.0 `xsl:package` for transforming XHTML tables to XSL-FO and/or HTML
 - `xsl:package` is new in XSLT 3.0
 - (X)HTML tables are used with many document types
 - A stable, reusable module for formatting tables will be a good thing

## Non-goals

- The single best way of doing anything
 - Since this is a testbed it's okay for it to try different ways of achieving the same result
- The definitive XSLT 3.0 testbed
 - This project is on GitHub because it's easy to fork Git projects and develop your own flavour of them
 - Pull requests are encouraged, but if you want to make your own version of this, that's more than fine, too
- Complete stylesheets for all of JATS
 - JATS gives the work a focus, but it isn't *the* focus of the work
 - The original XSLT 1.0 stylesheets don't cover all of JATS to begin with

## Scenarios

The idea is to eventually handle the following scenarios:

- Transform JATS to (X)HTML(5) for display/EPUB/print
 - With and without display of metadata
- Transform JATS to XSL-FO for pagination
 - Single column
 - Two column
 - With and without presentation of metadata

## Questions

There's undoubtedly many things to try out, but a starter list of things to look at includes:

- How will XSLT 3.0 features make it easier to:
 - Customise the output?
 - Modularise stylesheets?
 - Re-use modules between HTML and XSL-FO output?
- Will higher-order functions, anonymous function, partial function application, and/or dynamic XPath evaluation improve upon xsl:attribute-set?

## Acknowledgements

- The National Library of Medicine (NLM) published the original "NISO Journal Article Tag Suite (JATS) version 1.0" stylesheets
- Mentea (http://www.mentea.net/) started the testbed.
- Collaborators and contributors will be acknowledged here, too

## License

This work is in the public domain and may be reproduced, published or otherwise used without the permission of Mentea or of the National Library of Medicine (NLM).

Forks are encouraged (but so are pull requests).

See LICENSE.

For the "NISO Journal Article Tag Suite (JATS) version 1.0" stylesheets, NML request only that the NLM is cited as the source of the work.
