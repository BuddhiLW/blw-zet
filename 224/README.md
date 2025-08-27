# Kubernetes and GitOps

## The infrastructure 

Making a thoroughly complete Kubernetes setup isn't a simple task. Once you have it, it's great. But, you can take some couple days setting it up, at first.

There is the infra-side. That can be quite the hassle. Even more so, if you are running on "baremetal". e.g., personal computers running on some place, that you posses control over.

You may need to plug your modem directly in your computer, and set it up. DNS stuff, NAT, CGNAT, etc. Reroute multiple ISP's internet, through a bridged modem? You have multiple ways to organize your infra. And it will be unique. Or, you may just rent a cloud (that's expensive, ok?). Configure your `/etc/netplan/`.

Finally, you have to set up the servers in each box, or in your box (if you just have one). Set up kubernetes, micro-k8s or k3s, etc. Set it up across machine. Make worker(s) and control-panel machines. Maybe then you will need tailscale because you are behind CGNAT. You may go full cloudflare, using WARP, or something. Anyway, these boxes have to obey some rule on where to connect, where to send data to etc.

Finally, you may then plug it into your laptop or working-station to control them, through kubectl.

Ok, now you have **where** processing will take place.

## The K8S setup

### Dockerfiles and Discoverability

Define some starting app. Maybe a front and a backend service to deploy. They must have a `Dockerfile` to run these in a containerized environment. Preferably, they will pick up on the environment the endpoint names they should request to; the database address and all that jazz. Don't hard-code it on build-time; or, you will be stuck when you quickly want to warp different vars for development, staging, or production.

### Exposing your application

Anyways, then you have the "how do I expose these services" problem. Should you go for each NodePort? Imagine you have 20 microsservices. That's quite a job to spin yet another NodePort to maintain a hold of. Will you put it in a notepad and update it, continuously. That seems unrealistic. And, it is all high-number ports, like 30001.

So, you could spin up a Load Balancer! Nginx, Istio, Kong, Traefik, and so many other options... What this will do is unify a port, for which it will respond and route for the underlying services. 

It will take the network of all `myhostdomain.com` and redirect them to sub-spaces, like `api.myhostdomain.com`, `app.myhostdomain.com` and so on.

If you revese-proxied your boxes trough cloudflare - let's say - you could either use Terraform or work with their dashboards to setup your domain and expose ports etc there. With LBs, we just have to care of one or two ports setups. Not 20.

### Where to get your images from

You will have to push your images to some registry. Maybe GHCR, DockerHub, Quay.io, etc. I like everything Git. So, GHCR could be it. You make a workflow to build and push your images. Give the right permissions, and bum...

### GitOps

Now, you exposed your app on some public host. Great. How do you update your 20 microsservices when everyday new commits happen, all the time? You watch them all day? Wake up 2h and help your team to release it? No, that's crazy talk, lmao.

You should setup something like ArgoCD, in order to watch those repos for you. And, given some policy, send it to the cluster. Like, every commit to `main`, then create new replicas and offer your up to date services!

## That's quite a punch

The nice thing is, in the end, as you move from the infra hands-on to kubernetes. You can do more and more just with yaml files. Given you have enough credentials to operate on the things your configuration files want to operate on, everything works out.

And, keep in mind, reproduction comes from **Declarative** setups. Files. Configurations. Not on hacky *imperative* scripts. A quick fix. It's a bad idea.

You may imperatively fix things, but them move them to reflect these changes in the configs. Then, remove and apply kubectl on it.
