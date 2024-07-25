#!/bin/bash

if (pgrep redshift)
  do-nothing
else
  launch redshift
