# Distributed State Coordination Suite

## Introduction

The source for this draft is maintained on Github. Suggested changes should be
submitted as pull requests at https://github.com/lijerom/dscs-specs. The original
author is not an expert, so if something seems strange, you're probably right.

The Distributed State Coordination Suite (DSCS) is intended to form a generic
network for distributed applications that can provide the same guarentees as and
similar or better performance than a centralized client/server model does. It
itself is a protocol suite for coordinating state, data distribution, and
network topology in a peer-to-peer network.

## Design

### The flaws of distributed systems

There are four incompatible guarentees that a distributed data store can make:
* Everyone is syncronized (consistency)
* Everyone can access the data (availability)
* Minimization of latency (latency)
* Tolerance to network splits/partitions (partition tolerance)

#### The choice between consistency and latency

The PACELC theorem states that even when there is no network partition, one must
choose between consistency and latency, an inherent flaw of distributed systems.

It can be made acceptable by immediately performing computations on incoming
data, and then retroactively integrating latent packets. This is similar to
client-side prediction in modern games. It allows the presentation of an
acceptably imperfect state to the consumer, or when perfection is needed,
a head start on the relevant computations.

This, in general, would be extremely difficult with stateful computations.
However, functional reactive programming allows deriving a body of state
from a body of computations, preventing such conflicts by ensuring the
independence of the vast majority of computations, and easily allowing
cascading updates when necessary, while preserving still-valid results.

#### Maintaining trust in the face of network partitions

While the authenticity of a packet to an identity can be verified with digital
signatures, that can not be used to prove the order of state changes
(transactions), or that no transactions are being intentionally left out. In
addition, it's usually impractical to achieve the current state by replaying an
enormous list of transactions, so there must be a way to trust an opaque blob
of state.

This can be handled in a variety of ways. (transactions = state changes)

* Don't have state. Static data can be trusted solely by digital signatures.
* Don't care about trust. There is no real persistent state, only the here and
now. An example might be a real-time chat program. Chat logs from one side of
the network can optionally be relayed when the networks rejoin, though it is
not strictly trustworthy. Timestamps can prevent replay attacks.
* Use proof-of work (i.e. blockchains). The biggest chain was too expensive to
spoof, so it must be true. However, proof-of-work computations result in a high
latency, and any transactions on a smaller chain in the event of a network
partition are nullified, destroying availability.[1] This relies on there being
a certain level of activity though, if my understanding is correct.
* Use trusted observers. While this sacrifices being perfectly distributed, a
dynamic web-of-trust can allow the verification of all data-- as long as enough
people are connected. Any actions that occured during a period when the chain of
trust was insufficiently configured would result in the nullification of that
data or a netsplit.
* Use third-party trusted observers. Rather than a dynamic friend-to-friend
web-of-trust, what in essence is a server is used, probably as a supplement
to the dynamic system. This is the least trustworthy system, but is no worse,
when not better than, a client/server model.[2]

The DSCS will support all of these options, and they may be chosen as appropriate
for an application.


[1] In a lot of situations, this is actually acceptable, since only small,
local portions of the network are likely to disconnect at any time, which is why
cryptocurrencies like Bitcoin work. If two networks are inherently going to have
an unreliable link, one can simply run two independent networks. In the case of
a cryptocurrency, atomic exchanges between them can be securely done while the
network is up, allowing currency availability on either side, while still
allowing trade between them. There was an excellent article on this, but I seem
to have lost it.

[2] At the present time I foresee only two instances where this would be
necessary. One might be if network is too irregular for a persistent sufficient
quantity of your trusted observers to be available, yet nobody can trust
eachother anyway. The other is when a secret needs to be kept to prevent
cheating in a game (e.g. a player's location, or the location of a secret base),
in conjunction with a much more complex system to handle this described below.

#### The choice between consistency and availability

According to the CAP theorem, in the event of a network partition, either
consistency or availability must be sacrificed. A sacrifice in availability
is equivalent to the client/server model, where the data on the other part of
the network is simply unavailable. Since the entire point of DSCS is distributed
state, implying massive redundancy, this would often not be an issue, except for
in the case of soft partitions (described below), or blockchains (described
above), unless a complete lock was intentionally forced. Otherwise, the networks
will simply run independently and merge, at the cost of either side being
inconsistent with the other until that point.

#### The choice between consistency and availability

The PACELC theorem can be made acceptable by immediately performing
computations on the data coming in, and then retroactively including the
latent packets. This is similar to client-side prediction in modern games.
It allows presenting an acceptably inaccurate state to the user, or when
perfect accuracy is absolutely necessesary, reduces the latency caused by
computation. That task can be made easier by functional reactive programming
(wherein the body of state is derived from a body of calculations rather than
being directly set, which would make retroactively changing state extremely
difficult).

### Performance and scalability

A serious internet network needs to scale with inevitable exponential growth,
provide high bandwidth, and very importantly, minimize latency, without
sacrificing any of its guarentees.

#### Distributed data

In a DSCS network, depending upon the trust system, a very large number of peers
at any given time redundantly store data. If the data is broken up into chunks,
each connected peer can provide a chunk, resulting in extremely high throughput,
similar to how bittorrent functions.

#### Routing optimization

DSCS will have an optional protocol for self-organizing networks, with the
fastest nodes carrying more traffic or something.

#### Soft partitions

### Anonymity, privacy, and security

#### Friend-to-friend routing

#### Compatibility with existing anonymity overlay networks
 
#### End-to-end encryption

#### Digital signatures and identities

### Spam and DoS resiliance

#### The web-of-trust revisited

#### Proof-of-work

#### Throughput rationing

#### Secret identities (?)

### Adaptability

#### Providing options

#### Fallbacks and stripping

#### Modularity and reusability
