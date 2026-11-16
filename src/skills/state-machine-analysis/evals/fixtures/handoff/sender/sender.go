package sender

import "errors"

type Message struct {
	ID      string
	OrderID string
}

type Publisher interface {
	Publish(Message) error
}

type Request struct {
	ID          string
	OrderID     string
	Sent        bool
	FailPersist bool
}

func (r *Request) Send(p Publisher) error {
	if r.Sent {
		return nil
	}
	if err := p.Publish(Message{ID: r.ID, OrderID: r.OrderID}); err != nil {
		return err
	}
	if r.FailPersist {
		return errors.New("local persistence failed")
	}
	r.Sent = true
	return nil
}
