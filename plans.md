# Plans

## Structure
The website will be structured thus:

### Pages
- Profile (About Me)
- Work experiences
- Projects and experiments
- Books
    - Read
    - Being read
    - Wish list

### Blogs
- Tech
    - DevOps
    - Solution Architecture
- Bible study
- Commute stories

## Design Ideas
-

## Workflow
### Dev
- Install npm and bower packages
- grunt develop
  - clean
  - images
  - less
  - css:dev
  - jekyll build
- grunt watch
  - html changes
    - grunt jekyll:build
  - less changes
    - grunt less
  - Jekyll build html template files
- Watch changes js files
  - grunt js
- Watch changes to less files
  - grunt less

### Publish
- grunt publish
  - clean
  - images
  - less
  - css:min
  - jekyll build
