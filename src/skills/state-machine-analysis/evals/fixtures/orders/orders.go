package orders

import (
	"errors"
	"strings"
)

type Order struct {
	PaymentConfirmed bool
	Shipped          bool
	Hold             bool
}

func (o *Order) ConfirmPayment()   { o.PaymentConfirmed = true }
func (o *Order) SetHold(hold bool) { o.Hold = hold }

func (o *Order) Dispatch() error {
	if !o.PaymentConfirmed || o.Hold || o.Shipped {
		return errors.New("dispatch rejected")
	}
	o.Shipped = true
	return nil
}

type Attempt struct{ Outcome string }

type Job struct {
	Done     bool
	Attempts int
	Limit    int
}

func (j *Job) Run(fails bool) (Attempt, error) {
	if j.Done || j.Attempts >= j.Limit {
		return Attempt{}, errors.New("run rejected")
	}
	j.Attempts++
	if fails {
		return Attempt{Outcome: "failed"}, errors.New("attempt failed")
	}
	j.Done = true
	return Attempt{Outcome: "succeeded"}, nil
}

func NormalizeStatus(value string) string { return strings.TrimSpace(value) }
