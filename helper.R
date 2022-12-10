# This is a helper file that shows how to utilize the Spotify API

# Install the spotifyr package and use it in this file
install.packages('spotifyr')
library(spotifyr)
# set the Client ID and Client Secret ID that you received from
# your Spotify Developer Account
Sys.setenv(SPOTIFY_CLIENT_ID = '4b6653925c2c4642b3d434ae599e7ca0')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'ffcf9dcb2c704e7c8186da25022ab60c')
# set your access_token
access_token <- get_spotify_access_token()
# get the playlist's from spotify using this method
# https://open.spotify.com/playlist/(6UeSakyzhiEt4NB3UAd6NQ) 
# use the part of the URL that is in parentheses above to get the
# playlist correctly
top100 <- get_playlist_tracks('6UeSakyzhiEt4NB3UAd6NQ')
top100
# saving the songs in another dataframe and adding name+rank
# look at documentation to get other variables of each track
songs <- get_track_audio_features(top100$track.id, authorization = get_spotify_access_token())
songs$name <- top100$track.name
songs$rank <- seq(1,100)
songs
