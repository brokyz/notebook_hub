#!/bin/bash
jupyter lab --allow-root > /root/log/lab.log &
jupyter notebook --allow-root > /root/log/notebook.log &