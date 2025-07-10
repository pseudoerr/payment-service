package util

import (
	"math/rand"

	"github.com/brianvoe/gofakeit"
)

func GenerateRandomOwner() string {
	fakeFirstName := gofakeit.Name()
	fakeLastName := gofakeit.LastName()
	return fakeFirstName + " " + fakeLastName
}

func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

func RandomMoney() int64 {
	return RandomInt(0, 1000)
}

func RandomCurrency() string {
	currencies := []string{
		"USD", "EUR", "CAD", "AUD", "JPY", "GBP", "CNY", "INR", "RUB", "BRL",
	}
	return currencies[rand.Intn(len(currencies))]
}
