<!doctype html>
<html
  xmlns="http://www.w3.org/1999/xhtml"
  lang="$lang$"
  xml:lang="$lang$"
  $if(dir)$
  dir="$dir$"
  $endif$
>
  <head>
    <meta charset="utf-8" />
    <meta name="generator" content="pandoc" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=yes"
    />
    $for(author-meta)$
    <meta name="author" content="$author-meta$" />
    $endfor$ $if(date-meta)$
    <meta name="dcterms.date" content="$date-meta$" />
    $endif$ $if(keywords)$
    <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$" />
    $endif$ $if(description-meta)$
    <meta name="description" content="$description-meta$" />
    $endif$
    <title>$if(title-prefix)$$title-prefix$ – $endif$$pagetitle$</title>
    $for(css)$
    <link rel="stylesheet" href="$css$" />
    $endfor$
    <link
      id="theme-stylesheet"
      type="text/css"
      rel="stylesheet"
      href="/assets/css/bootstrap.css"
    />

    <link
      type="text/css"
      rel="stylesheet"
      href="/assets/css/bootstrap-responsive.css"
    />
    <link type="text/css" rel="stylesheet" href="/assets/css/docs.css" />
    <link type="text/css" rel="stylesheet" href="/assets/css/monokai.css" />
    <link type="text/css" rel="stylesheet" href="/assets/css/vimwiki.css" />
    <link
      type="text/css"
      rel="stylesheet"
      href="/assets/css/font-awesome.css"
    />

    <script type="text/javascript" src="/assets/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="/assets/js/jquery-migrate-3.4.1.min.js"></script>


    <script
      type="text/javascript"
      src="/assets/js/bootstrap-2.3.0.js"
    ></script>
    <script type="text/javascript" src="/assets/js/highlight.pack.js"></script>

    $for(header-includes)$ $header-includes$ $endfor$ $if(math)$ $math$ $endif$
  </head>
  <body data-spy="scroll" data-target=".bs-docs-sidebar">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
          <a
            class="btn btn-navbar"
            data-toggle="collapse"
            data-target=".nav-collapse"
          >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>

          <button
            id="themeToggle"
            onclick="toggleTheme()"
            style="
              background-color: transparent;
              border: none;
              display: block;
              float: right;
              height: 40px;
              line-height: 40px;
            "
          >
            🌙
          </button>
          <!-- Be sure to leave the brand out there if you want it shown -->
          <!-- <a class="brand" href="http://code.google.com/p/vimwiki/">Vimwiki</a> -->

          <!-- Everything you want hidden at 940px or less, place within here -->
          <div class="nav-collapse collapse">
            <!-- .nav, .navbar-search, .navbar-form, etc -->
            <ul class="nav">
              <li class="">
                <a href="/index.html">Index</a>
              </li>
              <li class="">
                <a href="/README.html">Read Me</a>
              </li>
              <!-- ><li class="">
                        <a href="./workspace/index.html">Workspace</a>
                    </li>
                    -->
              <li class="">
                <a href="/diary/diary.html">Diary</a>
              </li>
              <li class="">
                <a href="/tags.html">Tags</a>
              </li>
              </li>
              <li class="">
                <a href="/flightcentre/flightcentre-index.html"
                  >Flight Centre</a
                >
              </li>
              <li class="">
                  <a href="/feed.rss"><img src="/assets/img/feed-icon.svg" alt="Feed Icon" width="16px"
                            height="16px"/>&nbsp;Feed</a>
              </li>
              <!--
                    <li class="">
                        <a href="#">Calendar</a>
                    </li>
                    <li class="">
                        <a href="/todo.html">To Do</a>
                    </li>
                    -->
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3 bs-docs-sidebar">
          <ul id="sidebar_list" class="nav nav-list bs-docs-sidenav affix"></ul>
        </div>

        <div id="content" class="span7">$body$</div>
      </div>
    </div>

    <a href="#" class="backtotop"
      ><i class="fa fa-arrow-circle-up fa-4x"></i
    ></a>
    <!-- Footer
    ================================================== -->
    <footer class="footer">
      <div class="container">
        <p>
          <a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a>
          licensed under
          <a href="http://www.apache.org/licenses/LICENSE-2.0"
            >Apache License v2.0</a
          >.
        </p>
        <p>
          <a href="http://fortawesome.github.com/Font-Awesome">Font Awesome</a>
          licensed under
          <a href="http://scripts.sil.org/OFL">SIL Open Font License</a>.
        </p>
        <p>
          <a href="http://softwaremaniacs.org/soft/highlight/en/"
            >highlight.js</a
          >
          licensed under
          <a href="http://opensource.org/licenses/BSD-3-Clause"
            >Modified BSD License</a
          >.
        </p>
        <ul class="footer-links"></ul>
      </div>
    </footer>
    <script>
      function toggleTheme() {
        const themeLink = document.getElementById("theme-stylesheet");
        if (themeLink.getAttribute("href") === "./assets/css/bootstrap.css") {
          themeLink.setAttribute("href", "./assets/css/bootstrap-dark.css");
          document.getElementById("themeToggle").textContent = "☀️";
          localStorage.setItem("theme", "dark");
        } else {
          themeLink.setAttribute("href", "./assets/css/bootstrap.css");
          document.getElementById("themeToggle").textContent = "🌙";
          localStorage.setItem("theme", "light");
        }
      }

      // need to escape $$ so that pandoc doesn't interpret $$ as one if its variables.
      $$(function () {
        var items = [];
        <!-- the header items are not nested. the h2s are not "inside" the h1 in the DOM. -->
        $$("h1").each(function () {
          items.push(
            '<li class="nav-header"><a class="toggle-submenu" href="#' +
              this.id +
              '"><i class="fa fa-chevron-right pull-right" style="line-height: 20px"></i> ' +
              $$(this).text() +
              "</a>",
          );
          items.push(
            '<ul class="nav nav-list submenu" style="display: none;">',
          );
          $$("h2").each(function () {
            items.push(
              '<li><a href="#' +
                this.id +
                '"><i class="fa fa-chevron-right pull-right" style="line-height: 20px"></i> ' +
                $$(this).text() +
                "</a>",
            );
          });
          items.push("</ul>");
          items.push("</li>");
        }); // close each()

        $$("#sidebar_list").append(items.join(""));

        $$("#sidebar_list").on("click", ".toggle-submenu", function (e) {
          e.preventDefault();
          const $$submenu = $$(this).siblings(".submenu");
          $$submenu.slideToggle(200);
          const $$icon = $$(this).find("i");
          $$icon.toggleClass("fa-chevron-right fa-chevron-down");
        });
      });

      // Apply saved theme on load
      window.addEventListener("DOMContentLoaded", () => {
        const savedTheme = localStorage.getItem("theme");
        if (savedTheme === "dark") {
          toggleTheme();
        }
      });

      hljs.initHighlightingOnLoad();
    </script>
  </body>
</html>
