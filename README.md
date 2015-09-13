# Interview Logs

I have this strange obsession with collecting interview/whiteboard questions. Here are a couple of questions I've collected over the past few weeks.

They're not separated by language since the problems themselves aren't language specific, but not all of them are written in the same language.

Feel free to submit a pull request with your annotated solution in another language.


## How to Whiteboard

An interviewer at Google once laid out some really useful tips for Whiteboarding. Running through these step with an interviewer helps keep you moving forward. By asking for the following, you begin to see the many parts of your problem and you can begin mapping what it's going to take to solve it. It also gives you some canned phrases that you can use that show the interviewer you're thinking about things like interface and complexity while you code. Win/win.

- Ask for the function signature
  - What are the inputs?
  - What Type are the inputs?
  - What Type is the return?
- Ask for examples
  - Useful because you can turn these into tests
  - If you're on something like Stypi or Coderpad, ALWAYS write your tests first
- Clarify constraints
  - Is the interviewer more concerned with HOW you solve it, or simply THAT you solve it?
  - What complexity is acceptable?
- Talk it out as much as possible

I've written these out for most of the questions here. My hope is that Whiteboarding without this information seems foreign to you and asking for this information becomes second nature.


## Repo Structure

Challenges will be linked to from this README document. You'll be sent into the `challenges/$CHALLEGE` folder, which will contain its own README, outlying the problem and any constraints and examples. I'll do my best to act as the actual interviewer by only supplying enough information to complete the challenge. Each folder will also contain a solution file. You probably shouldn't look at this until you've given the problem a shot.


## Table of Contents

### Implement a Datastructure
- [Graph](./questions/implement_a_graph)
- [Set](./questions/implement_a_set)
- TODO: [Linked List](./questions/implement_a_linked_list)
- [Hash Map](./questions/implement_a_hash)
- TODO: [Binary Tree](./questions/binaryTree)

### Logic
- [Make Change](./questions/makeChange)
- [Squared Sums](./questions/squaredSum)
- [Binary Conversion](./questions/binary_conversion)
- [Brace Checker](./questions/brace_checker)
- [Number is a Palindrome?](./questions/palindrome_number)
- [Prime Factors](./questions/prime_factors)
- [Reverse a String](./questions/reverse_a_string)
- TODO: [Second to Last](./questions/second_to_last)

### How Does The Internet Work?

This is a common one. Below is a tl:dr that satisfies most interviewers. The deeper you go though, the better. [Here's an insanely detailed event stream.](https://github.com/alex/what-happens-when)

##### tl;dr
1. Browser needs an IP
  - DNS resolution chain: browser cache > local HOSTS file > Router's DNS > ISPs DNS
  - Using ISP: Network stack uses ARP to find its configured DNS server
  - IP address is found for hostname `google.com`

2. Browser asks OS to open a TCP connection to the resolved IP address
  - With an IP address:
    - OS calls the network stack to search for the next hop using a SYN request
    - SYNs and ACKs are traded between network nodes until the destination sever is reached
    - Path to host is now known
  - Server responds that it's ready to receive data
  - OS/Browser receive signal that the server is ready to receive

3. HTTP protocol is started; GET request sent
  - Requests can contain headers (cookies, user-agents, tokens, query params)
  - If request is POST, can contain a payload in addition to headers

4. Server receives GET through the TCP/IP protocol
  - Web Server routes incoming request to appropriate action based on the Method used to address the server
  - Web App server generates a Response based on input
  - Server responds to Request by sending back a Response

5. Browser receives Response (big string)
  - Response/String is parsed into Response Headers and a Payload
  - Headers are read; cookies stored, etc
  - Browser parses the Payload (HTML)
  - If HTML contains links to other resources (*.js, css, images*) the process starts all over again

6. Browser renders the parsed Response's payload
