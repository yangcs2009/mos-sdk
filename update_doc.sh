#!/bin/bash
source ~/rc_climc_doc
rdoc
climc swift-upload rubyapidoc "doc/*"
