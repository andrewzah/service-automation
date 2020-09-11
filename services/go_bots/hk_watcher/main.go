package main

import (
	"fmt"
	"os"
	"regexp"
	"strings"

	"github.com/go-telegram-bot-api/telegram-bot-api"
	"github.com/thecsw/mira"

	log "github.com/sirupsen/logrus"
)

func checkErr(msg string, err error) {
	if err != nil {
                log.Errorln("%s: %s", msg, err)
		os.Exit(1)
	}
}

var (
	chatId   = int64(664430725)
	keywords = []string{"p30ls"}
)

func main() {
	r, err := mira.Init(mira.ReadCredsFromEnv())
	checkErr("mira init", err)

	c, err := r.Subreddit("gundeals").StreamSubmissions()
	checkErr("stream submissions", err)

	reg, err := regexp.Compile("[^a-zA-Z]+")
	checkErr("compiling regexp", err)

        apiKey := os.Getenv("TELEGRAM_API_KEY")

	bot, err := tgbotapi.NewBotAPI(apiKey)
	checkErr("new bot from api key", err)

	log.Infoln("done setting up, about to start listening!")

	for {
		post := <-c

		title := post.GetTitle()
		parsed_title := reg.ReplaceAllString(strings.ToLower(title), "")
		log.Infoln(post.GetTitle())

		for _, keyword := range keywords {
			if strings.Contains(parsed_title, keyword) {
				text := fmt.Sprintf("matched %s: %s\n\n %s", keyword, title, post.GetUrl())
				msg := tgbotapi.NewMessage(chatId, text)
				bot.Send(msg)

				log.Infoln(title)
			}
		}
	}
}

// determine chat id
//
// for update := range updates {
// 	log.Infoln("%v", update)

// 	if update.Message == nil {
// 		continue
// 	}

// 	log.WithFields(log.Fields{
// 		"chatId": update.Message.Chat.ID,
// 		"text":   update.Message.Text,
// 	}).Info("Received msg")
// }
