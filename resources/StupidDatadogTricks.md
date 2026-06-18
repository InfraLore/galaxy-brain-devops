<!-- Slide number: 1 -->
# Stupid Datadog Tricks
Team Spotlight: Share & Learn
April 3, 2026
Hardy Pottinger
tiny.ucsf.edu/StupidDatadogTricks

### Notes:
Hey there, I’m Hardy, and most of you know me. I work with Jessica on the Developer Experience Team. The title of this presentation is Stupid Datadog Tricks. That’s a reference to an old David Letterman bit, Stupid Human Tricks. But like the show, these tricks aren’t really “stupid.” This is a talk about Datadog and some tips on getting useful insights from it. This is not a deep dive; my goal is to make Datadog feel approachable and share a few patterns that make it easier to use. That’s the link to these slides there on the bottom.

<!-- Slide number: 2 -->
# Complexity Is Normal

![](Picture5.jpg)

![](Picture4.jpg)
2
Stupid Datadog Tricks, April 3, 2026

### Notes:
When people open Datadog the first time, it can feel like this. Gauges everywhere, controls everywhere; it’s hard to know where to start. These images are of the control room of U-boat 110, a German submarine from World War II.

<!-- Slide number: 3 -->
# Focus on the SignalThat Answers Your Question

![](Picture7.jpg)
3
Stupid Datadog Tricks, April 3, 2026

### Notes:
Operators do not look at every gauge all at once. They look at the instrument that answers their question. How far have we dived? The depth gauge. What is happening inside the system right now? The pressure gauge. Are we trimmed and carrying the right amount of water? The ballast gauge. Don’t look too closely at this image, though. ChatGPT made this image, and the model struggled to get the gauges right. It went for vibe, and I think that’s OK. The point here is that Datadog works in the same way.

<!-- Slide number: 4 -->
# Datadog: Explore, Visualize, Alert

![](Picture9.jpg)

![](Picture7.jpg)
Explore operational data
Visualize it
Alert on it

![](Picture11.jpg)
4
Stupid Datadog Tricks, April 3, 2026

### Notes:
Datadog collects data from systems, then gives you the tools to act on that data: you can explore data, visualize it to look for patterns, then alert based on those patterns.

<!-- Slide number: 5 -->
# Metrics, Logs, Traces
Metrics	numbers over time (CPU usage, request rate, latency, restarts)
Logs	event records (error messages, access/login, workflows)
Traces	request paths through services (one request moving through API to app to database)

5
Stupid Datadog Tricks, April 3, 2026

### Notes:
Three types of data in Datadog: Metrics, Logs, and Traces. Metrics show trends, Logs show details, and Traces show request paths. I’ll just mention specifically that our GitHub Enterprise audit logs are in our Datadog. Which means we have login records for GitHub Enterprise, as well as every GitHub Actions workflow result. Our Datadog instance doesn’t have many traces, which requires a specific agent configuration. Talk to the Datadog team if you need traces, but right now, the important thing to know is that our Datadog instance already has a lot of data in it.

<!-- Slide number: 6 -->
# Start With the Data That Already Exists
The UCSF Datadog instance already has a lot of data
infrastructure metrics
Kubernetes metrics
service metrics
logs
GitHub Enterprise audit logs
some traces

6
Stupid Datadog Tricks, April 3, 2026

### Notes:
And you should start with what’s already in Datadog.

<!-- Slide number: 7 -->
# Explore Datadog Freely
If you can log in, you can explore the data:
Explore metrics
Browse logs
Build dashboards
Create views

https://it.ucsf.edu/service/datadog ← request a login
7
Stupid Datadog Tricks, April 3, 2026

### Notes:
If you have a login, YOU can play with ALL of this data. If you don’t have a login, go to the link on this slide and request a login.

<!-- Slide number: 8 -->
# Bringing Data Into Datadog
agents
integrations
application instrumentation
log pipelines

https://it.ucsf.edu/how-to/how-enroll-service-datadog
8
Stupid Datadog Tricks, April 3, 2026

### Notes:
If the data you want to use is not yet in Datadog, you can go to the link on this slide and request to have your data enrolled. The process involves some variation of an agent software that you’d run on the machine you’d like to send data from, or an integration with a service (GitHub Enterprise uses an integration), or an application-specific configuration (we’re working on that right now with SmartSheet), or a log pipeline. But the gist of this is: if you need to get data into Datadog, talk to the Datadog team.

<!-- Slide number: 9 -->
# Queries, Views, Dashboards, Monitors
Query	A question you ask the data.
View	A saved query.
Dashboard	A collection of widgets (views).
Monitor	An automated alert.

9
Stupid Datadog Tricks, April 3, 2026

### Notes:
These four concepts power most Datadog workflows. A query is a question you ask the data. A view is a saved query. A dashboard is a collection of widgets (which are just views). A monitor is an automated alert.

<!-- Slide number: 10 -->
# Turn Questions Into Monitors

![](Picture11.jpg)
demo
10
Stupid Datadog Tricks, April 3, 2026

### Notes:
Here’s my first trick. We’re going to go through asking a question, answering it with a view, add that view to our dashboard, then turn it into a monitor.

<!-- Slide number: 11 -->
# Save Useful Views and Share Them on Dashboards
Dashboards aren’t something you build
Dashboards are a place where you collect useful views
Dashboards make views easier for your team to access
Dashboards are buckets, not billboards
demo
11
Stupid Datadog Tricks, April 3, 2026

### Notes:
So, this will happen a lot, as you use Datadog to find answers to questions. You’ll write a query, turn it into a view, turn that view into a widget on a dashboard. LETS DEMO THAT NOW.After a few weeks of this, you’ll realize that the weird/hard task you had added to your TODO list, “make a dashboard in Datadog,” is done. And that dashboards aren’t really things you build procedurally--you kind of accidentally build them, because they’re mostly just a bucket to hold widgets. They’re buckets, not billboards.

<!-- Slide number: 12 -->
# Demo 2: Let Dashboards Grow Over Time

![](Picture7.jpg)
12
Stupid Datadog Tricks, April 3, 2026

### Notes:
Dashboards grow over time. You answer a question with a view, save the view, add it to a dashboard (so your team can find it more easily). Then, you repeat the process. And your dashboard evolves. Remember that submarine control room? THAT "dashboard" grew the same way. I’m going to show you the DevEx dashboard now, and we’ll look at each of the pieces and how they’re built.

<!-- Slide number: 13 -->
# Use One Time Range Across the Dashboard
Widgets can use their own date range
Usually, don’t do this
Most widgets should follow the dashboard’s global time range
Then your widgets sync to the dashboard’s time range

demo
13
Stupid Datadog Tricks, April 3, 2026

### Notes:

<!-- Slide number: 14 -->
# Place Related Widgets Together
Top “whatever” thing you’re counting
Orgs Running GitHub Actions on GHES
Timeseries widget for the same view
Top Orgs Running Actions, Timeseries

demo
14
Stupid Datadog Tricks, April 3, 2026

### Notes:
Placing related widges together on your dashboard helps reveal relationships between signals.
As you hover over a name in the aggregate list, the timeseries graph will highlight the matching data.

<!-- Slide number: 15 -->
# Turn Important Queries Into Monitors
A monitor is a query that runs continuously.
A widget is a dashboard visualization of a view/query.
The same query can be used to create a monitor.
A widget can be transformed into a monitor with a few clicks.

demo
15
Stupid Datadog Tricks, April 3, 2026

### Notes:
So, recap a bit, a widget is based on a view, and a view is a saved query. The same query can be transformed into a monitor, and a monitor runs that query repeatedly. You can also use a widget to create a monitor.

<!-- Slide number: 16 -->
# Schedule Downtimes for Monitors
Datadog Downtimes help you avoid alerts during planned work.
Helpful for:
Maintenance windows
Deployments
Infrastructure upgrades
Expected outages
demo

16
Stupid Datadog Tricks, April 3, 2026

### Notes:
Monitors are great. Annoying your team when you know the system will be down is rude. Datadog downtimes can help you avoid this faux pas.

<!-- Slide number: 17 -->
# Start With Questions
17
Stupid Datadog Tricks, April 3, 2026

### Notes:
This is my main advice for you, for how to approach using Datadog: start with questions.
Speaking of questions, do you have any for me?

<!-- Slide number: 18 -->
# Acknowledgements
server rack, by agnesID from Noun Project (CC BY 3.0)
Datadog logo from Datadog
application by Konkapp from Noun Project (CC BY 3.0)

18
Stupid Datadog Tricks, April 3, 2026

### Notes:
Here are some acknowledgments for the images used in this presentation.
