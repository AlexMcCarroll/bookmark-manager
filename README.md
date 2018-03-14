# Bookmark Manager

## User Stories:

```
As a user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

+-------------------+         .all          +-------------------+
|                   |  +----------------->  |                   |
|    controller     |    [array of links]   |      links        |
|                   |  <-----------------+  |                   |
|                   |                       |                   |
+-------------------+                       +-------------------+


As a user
So that I can save a website
I would like to enter and submit it to be saved to bookmark manager

As a user
So that I can keep the content clean and relevant
I would like to be able to delete links

As a user
So that I can keep the content clean and relevant
I would like to be able to update links

+-----------------+            +------------------+
|                 |    .add    |                  |
|    new link     | +--------> |      links       |
|                 |            |                  |
+-----------------+            +-+-------+--------+
                                 ^       ^
                          .delete|       |.update
                       +---------+-------+-+
                       |     existing      |
                       |       link        |
                       +-------------------+


As a user
So that I can remember why I saved a link
I would like to comment on links

+-----------------+            +-------------------+
|                 |            |                   |
|    controller   |.add_comment|    existing       |
|                 | +--------> |      link         |
|                 |            |                   |
+-----------------+            +-------------------+


As a user
So I can find the content I have added more easily
I would like to tag links into categories

As a user
So I can filter and find content that I am interested in
I would like to filter links by tag

As a user
So that I can keep the content I have added under control
I would like to manage my links
```
## To get started:

```
git clone https://github.com/sjmog/bookmark_manager
cd bookmark_manager
bundle install
rake setup
rspec
```
