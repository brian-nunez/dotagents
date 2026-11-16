package lease

import (
	"sync"
	"time"
)

type Record struct {
	mu        sync.Mutex
	token     string
	expiresAt time.Time
	finished  bool
}

func (r *Record) Acquire(now time.Time, token string, duration time.Duration) bool {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.finished || r.expiresAt.After(now) || token == "" || duration <= 0 {
		return false
	}
	r.token = token
	r.expiresAt = now.Add(duration)
	return true
}

func (r *Record) Renew(now time.Time, token string, duration time.Duration) bool {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.finished || token == "" || token != r.token || !r.expiresAt.After(now) || duration <= 0 {
		return false
	}
	r.expiresAt = now.Add(duration)
	return true
}

func (r *Record) Finish(now time.Time, token string) bool {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.finished || token == "" || token != r.token || !r.expiresAt.After(now) {
		return false
	}
	r.finished = true
	return true
}
