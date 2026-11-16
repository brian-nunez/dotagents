package receiver

import "example.com/state-machine-fixtures/handoff/sender"

type Handler struct {
	Seen  map[string]bool
	Apply func(string) error
}

func (h *Handler) Handle(message sender.Message) error {
	if h.Seen[message.ID] {
		return nil
	}
	h.Seen[message.ID] = true
	return h.Apply(message.OrderID)
}
