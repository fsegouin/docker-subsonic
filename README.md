# docker-subsonic
Dockerfile for subsonic (with flac & lame transcoders)

# Usage

Clone this repo and build the new image:

```
sudo docker build -t you/subsonic .
```

Create the data container with:

```
sudo docker run --name subsonic_data \
	-v /data/music:/var/music \
	-v /data/subsonic-config:/var/subsonic \
	you/subsonic:latest /bin/true
```


- In this example, the actual music files are managed in the **/data/music**.


- Data container manages **only the subsonic configuration information.** 

After creating this, run subsonic_app:

```
sudo docker run -d -t -i \
	--publish 8100:4040 \
	--name="subsonic_app" \
	--volumes-from subsonic_data \
	emauve/subsonic:latest
```


- In this example, we specify port 4040 to 8100.

# Port (default)
- 4040

# Data (default)
- /var/music
- /var/subsonic
