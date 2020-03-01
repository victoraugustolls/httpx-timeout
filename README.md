# httpx-timeout

Sample project to find reason behind httpx timeouts
This project use [vegeta](https://github.com/tsenart/vegeta) for stress testing.

Steps to reproduce:

1 - Build the project with `make build`

2 - Run it with `make run`

3 - Run the command: `vegeta attack -targets=tests/vegeta -rate=100 -duration=30s | vegeta report`

4 - Wait for a timeout to show. If not, run it again in sequence.



#### It does not happen always, it appears to be random. Stress testing just make it more common.
