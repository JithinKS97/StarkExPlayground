### StarkEx playground

#### Usage
1. Install `docker`:
```
apt install -y docker.io
```
2. Build the docker image:
```
docker build -t <MEMORABLE_NAME> .
```
3. Run the docker:
```
docker run -it <MEMORABLE_NAME>
```
4. In the docker container, run `./player.py --help` for further instructions.

#### Examples for querying the feeder gateway

To print the last batch ID to console, run:
```
wget -nv -q -O- https://gw.playground-v2.starkex.co/feeder_gateway/get_last_batch_id
```

Given the batch ID (say, batch ID 23), fetch the batch info by running:
```
wget -nv -q -O- https://gw.playground-v2.starkex.co/feeder_gateway/get_batch_info?batch_id=23
```

### To run in Mac M1

Build
`docker build -t playground --platform linux/arm64/v8 .`

Run
`docker run -it playground`

### Execute directly

`python ./player.py --txs txs.json --node_url https://goerli.infura.io/v3/866cd7f20d8846169cecdd5aa0142df1 --funder_private_key 0xcc7ae8e102837cf14304b317b6de38aed355202d23b321120151a19f55972832 --verbose`