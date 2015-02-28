# docker-subsonic
Dockerfile for subsonic

# Usage
Create the data container with:

```
sudo docker run --name subsonic_data
         -v /data/music:/var/music
         subsonic_image:5.2 /bin/true 
```

After crerateing this run subsonic_app:

```
sudo docker run -d -t -i --p 8100:4040 \
   --name="subsonic_app" \
   --volumes-from subsonic_data \
   subsonic_image:5.2
```

# Port
4040

# Data
/var/music
/var/subsonic