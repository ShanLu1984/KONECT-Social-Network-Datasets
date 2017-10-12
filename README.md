# Social network datasets (directed) from KONECT
## Introduction
This projects include extracting degree information from TSV file downloaded from KONECT Website http://konect.uni-koblenz.de/; and data visiualization.

## What's inside:
1. network_read.m 
* Usage: get indegree and outdegree of the nodes in the network;
* Output: degrees.mat  It contains a matrix data with dimension (n, 2), n is the number of nodes in the network; the first column is the indegree of the node; and the second column is the outdegree.
2. network_show.m
* Usage: plot the joint degree distribution of nodes in the network. The correlation between in-degree and out-degree is computed and show on the title of the figure;
* Output: .fig, joint degree of each node in log-log scale.
3. overlap_fraction.m
* Usage: get the nodes overlap percentage between top x% nodes ranked by outdegree and indegree in descending order. This figure reflects the asymptotic dependency between in-degree and out-degree of nodes with the increasing of nodes' degree;
* Output: .fig, overlap percentage as a function of fraction of top users ordered by out/in-degree. 

## Datasets:
### Facebook wall posts http://konect.uni-koblenz.de/networks/facebook-wosn-wall
The is the directed network of a small subset of posts to other user's wall on Facebook. The nodes of the network are Facebook users, and each directed edge represents one post, linking the users writing a post to the users whose wall the post is written on. Since users may write multiple posts on a wall, the network allows multiple edges connecting a single node pair. Since users may write on their own wall, the network contains loops.
* Size:	46,952 vertices (users)
* Volume:	876,993 edges
* Average degree (overall):	37.357 edges / vertex
* Reciprocity:	62.5%

### Youtube links http://konect.uni-koblenz.de/networks/youtube-links
This is the social network of Youtube users and their connections.
* Size: 1,138,499 vertices (users)
* Volume: 4,942,297 edges (links)
* Average degree (overall): 8.6821 edges / vertex
* Reciprocity: 79.0%


### Wikipedia talk, English http://konect.uni-koblenz.de/networks/wiki_talk_en
This is the communication network of the English Wikipedia. Nodes represent users of the English Wikipedia, and an edge from user A to user B denotes that user A wrote a message on the talk page of user B at a certain timestamp.
* Size: 2,987,535 vertices (users)
* Volume: 24,981,163 edges (messages)
* Average degree (overall):	16.724 edges / vertex
* Reciprocity:	21.5%

### Flickr Friendship http://konect.uni-koblenz.de/networks/flickr-growth
This is the social network of Flickr users and their friendship connections.
* Size: 2,302,925 vertices (users)
* Volume: 33,140,017 edges (friendships)
* Average degree (overall): 28.781 edges / vertex
* Reciprocity:	62.2%

### LiveJournal Frendship http://konect.uni-koblenz.de/networks/soc-LiveJournal1
This is the social network of LiveJournal. Nodes are users of LiveJournal, and directed edges represent friendships.
* Size:	4,847,571 vertices (users)
* Volume:	68,475,391 edges (friendships)
* Average degree (overall):	28.251 edges / vertex
* Reciprocity:	74.8%

### Google Hyperlink http://konect.uni-koblenz.de/networks/web-Google
This is a network of web pages connected by hyperlinks. The data was released in 2002 by Google as a part of the Google Programming Contest.
* Size: 875,713 vertices (webpages)
* Volume: 	5,105,039 edges (hyperlinks)
* Average degree (overall):	11.659 edges / vertex
* Reciprocity	30.7%

## How to run:
1. Select the dataset you are interested in, download the TSV file from the KONECT website.
2. Extract the .tar file.
3. Change the code in network_read.m. For example, for Facebook dataset: 
  ```
  node_size = 46952;
  dataset = 'out.FACEBOOK-WOSN-WALL';
  ```
 4.Type "network_read" in Command Window or open file "network_read.m" and click "Run" button on the top bar.
 5. To show the joint degree distribution of the network, change the code in network_show.m. For Facebook dataset:
 ```
 load('.\facebook-wosn-wall\degrees.mat');
 title(['facebook-wosn-wall, correlation: ' num2str(corr_inout)]);
 ```
 6. Type "network_show" in Command Window or open file "network_show.m" and click "Run" button on the top bar.
 7. To show the asymptotic dependency of the nodes' in- and out-degree, change the code in overlap_fraction.m. For Facebook dataset:
 ```
 load('.\facebook-wosn-wall\degrees.mat');
 legend('facebook-wosn-wall');
 ```
 8. Type "overlap_fraction in Command Window or open file "overlap_fraction.m" and click "Run" button on the top bar.
