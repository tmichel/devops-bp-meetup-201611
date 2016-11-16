package main

import (
	"encoding/json"
	"log"
	"math/rand"
	"net/http"
	"os"
)

// Band name, album name and album cover generation based on:
// http://www.noiseaddicts.com/2009/03/random-band-name-cover-album/
var (
	bands = []string{
		"Molecular Ecology",
		"Revolution X",
		"Jacob Ellison",
		"National Board of Revenue",
		"Duma people",
	}

	albums = []string{
		"Never deceived; we deceive ourselves",
		"In the ideas of living",
		"Birds or hear them sing",
		"Have long taken for granted",
		"Walls of our own homes",
	}

	albumsCovers = []string{
		"https://www.flickr.com/photos/57144254@N08/30930501566/",
		"https://www.flickr.com/photos/rosabelarte/22820870478/",
		"https://www.flickr.com/photos/turlej/31002838175/",
		"https://www.flickr.com/photos/105824138@N08/30899221401/",
		"https://www.flickr.com/photos/lucianorichino/30789910862/",
	}
)

func main() {
	http.HandleFunc("/album", generateAlbum)
	http.HandleFunc("/", version)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	log.Printf("Starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}

func generateAlbum(w http.ResponseWriter, r *http.Request) {
	json.NewEncoder(w).Encode(map[string]interface{}{
		"band_name": pickRandom(bands),
		"album": map[string]string{
			"title": pickRandom(albums),
			"cover": pickRandom(albumsCovers),
		},
	})
}

func pickRandom(list []string) string {
	return list[rand.Intn(len(list))]
}

func version(w http.ResponseWriter, r *http.Request) {
	json.NewEncoder(w).Encode(map[string]string{
		"app":     "band-generator",
		"version": "1.0.0,",
	})
}
