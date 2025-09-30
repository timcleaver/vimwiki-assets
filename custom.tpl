<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link id="theme-stylesheet" type="text/css" rel="stylesheet" href="%root_path%assets/css/bootstrap.css" />

<link type="text/css" rel="stylesheet" href="%root_path%assets/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="%root_path%assets/css/docs.css" />
<link type="text/css" rel="stylesheet" href="%root_path%assets/css/monokai.css" />
<link type="text/css" rel="stylesheet" href="%root_path%assets/css/vimwiki.css" />
<link type="text/css" rel="stylesheet" href="%root_path%assets/css/font-awesome.css">

<style>
    .day {
        position: absolute;
        top: 0.5em;
        right: 0;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        /*font-size: 18px; /* Adjust day number size */
        font-size: 0.6em;
        color: #000; /* Adjust day number color */
        /*font-weight: bold;*/
    }

    .calendar-emoji {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        /*font-size: 40px; /* Adjust emoji size */
        /*width: 50px; /* Set width of the calendar box */
        /*height: 50px; /* Set height of the calendar box */
        /*background-color: #f0f0f0; /* Optional: background color */
        border-radius: 8px; /* Optional: rounded corners */
        position: relative;
    }

    /* Robust tree styling: no glyphs, just borders */
.tree {
  margin: 0;
  padding: 0;
  list-style: none;
  line-height: 1.5;
}
.tree ul {                 /* draw the vertical trunk for each nested level */
  margin: 0;
  padding-left: 1.25em;    /* room for elbow + label */
  list-style: none;
  border-left: 1px solid #999;
}
.tree li {
  position: relative;
  margin: 0;
  padding: .15em 0 .15em .85em; /* room so text never hits the elbow */
}

/* horizontal connector from trunk to the label */
.tree li::before {
  content: "";
  position: absolute;
  left: -1.25em;           /* start at the trunk */
  top: calc(0.75em);       /* roughly midline of the row; tweak if your font size changes */
  width: 1.25em;           /* length of the horizontal segment */
  border-top: 1px solid #999;
}

/* hide the trunk below the last child’s elbow */
.tree ul > li:last-child::after {
  content: "";
  position: absolute;
  left: -1.25em;           /* exactly over the trunk */
  top: calc(0.75em + 1px); /* start just under the elbow line */
  bottom: -0.2em;          /* extend a bit past the item’s bottom */
  width: 1px;
  background: #fff;        /* match your page background */
}

/* Optional: tighter look on small fonts */
@media (max-width: 600px) {
  .tree ul { padding-left: 1.1em; }
  .tree li { padding-left: .75em; }
  .tree li::before { left: -1.1em; width: 1.1em; }
  .tree ul > li:last-child::after { left: -1.1em; }
}

/* Mermaid diagram styling fixes */
.mermaid {
    text-align: center;
    margin: 1em 0;
}

/* Ensure Mermaid SVG arrowheads are visible */
.mermaid svg {
    max-width: 100%;
    height: auto;
}

/* Fix for arrowhead markers that might be hidden */
.mermaid svg defs marker {
    overflow: visible !important;
}

.mermaid svg .edgePath marker {
    overflow: visible !important;
}

/* Ensure flowchart arrows are properly styled */
.mermaid .edgePath .path {
    stroke: #333 !important;
    stroke-width: 1.5px !important;
    fill: none !important;
}

.mermaid .marker {
    fill: #333 !important;
    stroke: #333 !important;
}

/* Fix for potential Bootstrap CSS conflicts */
.mermaid * {
    box-sizing: content-box;
}
</style>


<script type="text/javascript" src="%root_path%assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="%root_path%assets/js/jquery-migrate-3.4.1.min.js"></script>

<script type="text/javascript" src="%root_path%assets/js/bootstrap-2.3.0.js"></script>
<script type="text/javascript" src="%root_path%assets/js/mermaid-11.12.0.min.js"></script>
<script type="text/javascript" src="%root_path%assets/js/highlight.pack.js"></script>
<script type="text/javascript" src="%root_path%assets/js/d3.v7.min.js"></script>
<script type="text/javascript" src="%root_path%assets/js/d3.layout.cloud.js"></script>

<title>%title%</title>

</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <button id="themeToggle" onclick="toggleTheme()" style="background-color: transparent; border: none; display: block;float: right; height: 40px; line-height: 40px;">🌙</button>
            <!-- Be sure to leave the brand out there if you want it shown -->
            <!-- <a class="brand" href="http://code.google.com/p/vimwiki/">Vimwiki</a> -->

            <!-- Everything you want hidden at 940px or less, place within here -->
            <div class="nav-collapse collapse">
                <!-- .nav, .navbar-search, .navbar-form, etc -->
                <ul class="nav">
                    <li class="">
                        <a href="%root_path%index.html">Index</a>
                    </li>
                    <li class="">
                        <a href="%root_path%README.html">Read Me</a>
                    </li>
                    <!-- ><li class="">
                        <a href="%root_path%workspace/index.html">Workspace</a>
                    </li>
                    -->
                    <li class="">
                        <a href="%root_path%diary/diary.html">Diary</a>
                    </li>
                    <li class="">
                        <a href="%root_path%tags.html">Tags</a>
                    </li>
                    <li class="">
                        <a href="%root_path%flightcentre/flightcentre-index.html">Flight Centre</a>
                    </li>
                    <li class="">
                        <a href="%root_path%feed.rss"><img src="/assets/img/feed-icon.svg" alt="Feed Icon" width="16px"
                            height="16px"/>&nbsp;Feed</a>
                    </li>
                    <!--
                    <li class="">
                        <a href="#">Calendar</a>
                    </li>
                    <li class="">
                        <a href="%root_path%todo.html">To Do</a>
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
            <ul id="sidebar_list" class="nav nav-list bs-docs-sidenav affix">
            </ul>
        </div>


        <div id="content" class="span7">
            <!--Body content-->
            %content%

        </div>
  </div>
</div>
<a href="#" class="backtotop"><i class="fa fa-arrow-circle-up fa-4x"></i></a>
<!-- Footer
    ================================================== -->
<footer class="footer">
  <div class="container">
    <p><a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a> licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache License v2.0</a>.</p>
    <p><a href="http://fortawesome.github.com/Font-Awesome">Font Awesome</a> licensed under <a href="http://scripts.sil.org/OFL">SIL Open Font License</a>.</p>
    <p><a href="http://softwaremaniacs.org/soft/highlight/en/">highlight.js</a> licensed under <a href="http://opensource.org/licenses/BSD-3-Clause">Modified BSD License</a>.</p>
    <ul class="footer-links">
    </ul>
  </div>
</footer>
<script>
    function convertAsciiArrowsToUnicode(text) {
      const replacements = [
        // Longest patterns first
        [/<==>/g, '⟺'],
        [/<--->/g, '⟷'],
        [/<==/g, '⟸'],
        [/==>/g, '⟹'],
        [/<=>/g, '⇔'],
        // don't render in vim and may not in browsers
        //[/<--</g, '⭠'],
        //[/>-->/g, '⭢'],
        //[/<--|/g, '⭀'],
        //[/\|-->/g, '⭁'],
        //[/<~~/g, '⬳'],
        //[/~~>/g, '⬲'],
        //[/\|<--/g, '⭄'],
        //[/-->\|/g, '⭃'],

        // Medium patterns
        [/<-</g, '↢'],
        [/>->/g, '↣'],
        [/<-\|/g, '↤'],
        [/\|->/g, '↦'],
        [/<~/g, '↜'],
        [/~>/g, '↝'],
        [/\|<-/g, '⇤'],
        [/->\|/g, '⇥'],
        [/<->/g, '↔'],
        [/<=>/g, '⇔'],
        [/->>/g, '↠'],
        [/<<-/g, '↞'],

        // Basics
        [/<--/g, '⟵'],
        [/-->/g, '⟶'],
        [/<-/g, '←'],
        [/->/g, '→'],
        [/<=/g, '⇐'],
        [/=>/g, '⇒'],
      ];

      for (const [pattern, replacement] of replacements) {
        text = text.replace(pattern, replacement);
      }

      return text;
    }

    function walkAndReplace(node) {
      if (node.nodeType === Node.TEXT_NODE) {
        node.textContent = convertAsciiArrowsToUnicode(node.textContent);
      } else if (node.nodeType === Node.ELEMENT_NODE && !['SCRIPT', 'STYLE', 'NOSCRIPT'].includes(node.tagName)) {
        // Skip mermaid elements to avoid breaking diagram syntax
        if (node.classList && node.classList.contains('mermaid')) {
          return;
        }
        for (const child of node.childNodes) {
          walkAndReplace(child);
        }
      }
    }

    // Run after DOM is loaded, but AFTER Mermaid has processed
    document.addEventListener("DOMContentLoaded", () => {
      // Wait for Mermaid to finish processing before converting arrows
      setTimeout(() => {
        walkAndReplace(document.body);
      }, 100);
    });

    $(document).ready(function() {
        $('[id]').each(function () {
            const oldId = this.id;
            const newId = oldId
              .normalize('NFKD')
              .replace(/[\u0300-\u036f]/g, '')
              .replace(/[^\w\-]+/g, '-')
              .replace(/^-+|-+$/g, '')
              .toLowerCase();

            if (newId !== oldId) {
              this.id = newId;
              $(`a[href="#${CSS.escape(oldId)}"]`).attr('href', `#${newId}`);
            }
        });

        $('h1').each(function() {
            $(this).wrap('<section id="' + this.id + '"/>');
        });

        $('h1').wrap('<div class="page-header" />');
        $('h1').wrap('<div class="well well-small" />');

        // make the list of dates 4 columns wide
        if (document.title === "diary") {
            $('#content > ul').each(function() {
                $(this).css({ 'column-count': 4 });
            });
        } else {
            // hide empty h2s on non diary pages
            $('div > h2').each(function() {
                if ($(this).parent().nextAll().first().is('div') || $(this).parent().nextAll().length === 0) {
                    $(this).parent().remove();
                }
            });
        }

        $(function() {
            var items = [];
            <!-- the header items are not nested. the h2s are not "inside" the h1 in the DOM. -->
            $('h1').each(function() {
                items.push('<li class="nav-header"><a class="toggle-submenu" href="#' + this.id + '"><i class="fa fa-chevron-right pull-right" style="line-height: 20px"></i> ' + $(this).text() + '</a>');
                items.push('<ul class="nav nav-list submenu" style="display: none;">');
                let year_id = this.id;
                <!-- find all the nodes starting with the current year- -->
                $(`[id^="${year_id}-"]`).each(function() {
                    items.push('<li><a href="#' + this.id + '"><i class="fa fa-chevron-right pull-right" style="line-height: 20px"></i> ' + $(this).text() + '</a>');
                })
                items.push('</ul>');
                items.push('</li>');
            });  // close each()

            $('#sidebar_list').append(items.join(''));

            $('#sidebar_list').on('click', '.toggle-submenu', function(e) {
                e.preventDefault();
                const $submenu = $(this).siblings('.submenu');
                $submenu.slideToggle(200, function () {
                  // Callback runs after slideToggle animation finishes
                  updateBorders();
                });
                const $icon = $(this).find('i');
                $icon.toggleClass('fa-chevron-right fa-chevron-down');
            });

            <!-- replace date only links with emoji with calculated dates -->
            $('a').filter(function() {
                return /([0-9]{4}-[0-9]{2}-[0-9]{2})\s*(\u{1F5D3}\u{FE0F}?|\u{1F4C5})/u.test($(this).text());
            }).each(function() {
                $(this).html($(this).html().replace(/([0-9]{4}-[0-9]{2}-[0-9]{2})\s*(\u{1F5D3}\u{FE0F}?|\u{1F4C5})/ug, function(match, group1) {
                    var dayOfMonth = new Date(group1).getDate();
                    return `${group1} <span class="calendar-emoji">🗓️ <span class="day">${dayOfMonth}</span></span>`
                }))
            });
        });

        $('table').each(function() {
            $(this).addClass('table table-striped table-condensed table-hover');
        });

        $('.done0').each(function() {
            $(this).html(`
                <div class="alert alert-info" style="overflow: hidden;">
                        <div style="float: left; margin-right: 10px;">
                            <i class="fa fa-square-o"></i>
                            ${$(this).html()}
                        </div>
                        <div style="float: right; width: 150px;">
                            <div class="progress" style="margin: 0;">
                                <div class="bar bar-danger" style="width: 0%;"></div>
                            </div>
                        </div>
                    </div>
                </li>
            `);
            $(this).css("list-style", "none");
            //$(this).parent().css("list-style", "none");
        });

        $('.done1').each(function() {
            $(this).html(`
                 <div class="alert alert-info" style="overflow: hidden;">
                        <div style="float: left; margin-right: 10px;">
                            <i class="fa fa-minus-square-o"></i>
                            ${$(this).html()}
                        </div>
                        <div style="float: right; width: 150px;">
                            <div class="progress" style="margin: 0;">
                                <div class="bar bar-warning" style="width: 33%;">33%</div>
                            </div>
                        </div>
                    </div>
                </li>
            `);
            $(this).css("list-style", "none");
            //$(this).parent().css("list-style", "none");
        });

        $('.done2').each(function() {
            $(this).html(`
                <div class="alert alert-info" style="overflow: hidden;">
                        <div style="float: left; margin-right: 10px;">
                            <i class="fa fa-circle-o"></i>
                            ${$(this).html()}
                        </div>
                        <div style="float: right; width: 150px;">
                            <div class="progress" style="margin: 0;">
                                <div class="bar" style="width: 66%;">66%</div>
                            </div>
                        </div>
                    </div>
                </li>
            `);
            $(this).css("list-style", "none");
            //$(this).parent().css("list-style", "none");
        });

        $('.done3').each(function() {
            $(this).html(`
                <div class="alert alert-info" style="overflow: hidden;">
                        <div style="float: left; margin-right: 10px;">
                            <i class="fa fa-dot-circle-o"></i>
                            ${$(this).html()}
                        </div>
                        <div style="float: right; width: 150px;">
                            <div class="progress" style="margin: 0;">
                                <div class="bar" style="width: 99%;">99%</div>
                            </div>
                        </div>
                    </div>
                </li>
            `);
            $(this).css("list-style", "none");
            //$(this).parent().css("list-style", "none");
        });

        $('.done4').each(function() {
            $(this).html(`
                    <div class="alert alert-success" style="overflow: hidden;">
                        <div style="float: left; margin-right: 10px;">
                            <i class="fa fa-check-square-o"></i>
                            ${$(this).html()}
                        </div>
                        <div style="float: right; width: 150px;">
                            <div class="progress" style="margin: 0;">
                                <div class="bar bar-success" style="width: 100%;">100%</div>
                            </div>
                        </div>
                    </div>
                </li>
            `);
            $(this).css("list-style", "none");
            //$(this).parent().css("list-style", "none");
        });

        // Fade Out Back-To-Top-Link on new page
        $('.backtotop').fadeOut();

        $(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                $('.backtotop').fadeIn();
            } else {
                $('.backtotop').fadeOut();
            }
        });
        $('.backtotop').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 600);
            return false;
        });

        <!-- use the taskwarrior ids to color their text -->
        $("body").children().each(function() {
            $(this).html($(this).html().replace(/ \| project:\s*\w+/g, "").replace(/(#[a-f0-9]{6})[a-f0-9]{2}/g, function(match, group1) {
                return '<span style="color: ' + group1 + '">' + group1 + "</span>";
            }))
        });

        // Finds all <ul>s nested inside other <ul>s, Wraps their parent <li>'s contents in a toggle link, Adds Bootstrap
        // collapse behavior and toggle icons.
        // only apply to the diary page
        if (document.title === "diary") {
            $('ul:not(.nav-list) li:not(.done0):not(.done1):not(.done2):not(.done3):not(.done4) ul').each(function (i) {
                var $subList = $(this);
                var $parentLi = $subList.closest('li');
                var id = 'collapse-' + i;

                // Assign ID to the nested <ul>
                $subList.attr('id', id).addClass('collapse');

                var $existingLink = $parentLi.children('a').first(); // keep original link

                // Create a separate chevron icon link for toggling collapse
                var $chevronToggle = $(
                    '<a href="#' + id + '" data-toggle="collapse" class="chevron-toggle" ' +
                    'style="margin-left: 6px; cursor: pointer;"><i class="fa fa-chevron-right"></i></a>'
                );

                // Prevent chevron click from triggering navigation
                $chevronToggle.on('click', function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    $('#' + id).collapse('toggle');
                    $(this).find('i').toggleClass('fa-chevron-right fa-chevron-down');
                });

                // Insert the chevron toggle right after the original link
                $existingLink.after($chevronToggle);
            });
        }

        // Find all divs with IDs matching the pattern "Diary-YYYY"
        $('div[id^="Diary-"]').each(function() {
            // Check if the ID matches the exact pattern (Diary- followed by 4 digits)
            if ($(this).attr('id').match(/^Diary-\d{4}$/)) {
                // Insert an hr element before this div
                $(this).before('<hr class="year-separator">');
            }
        });

        const $sidebar = $('.bs-docs-sidenav.affix');

        function updateBorders() {
            const scrollTop = $sidebar.scrollTop();
            const scrollHeight = $sidebar[0].scrollHeight;
            const clientHeight = $sidebar.innerHeight();

            const atTop = scrollTop === 0;
            const atBottom = scrollTop + clientHeight >= scrollHeight - 1;

            // Toggle the border classes based on whether we're at the top or bottom of the sidebar ()
            $sidebar.toggleClass('has-top-border', !atTop);
            $sidebar.toggleClass('has-bottom-border', !atBottom);
        }

        // Initial check
        updateBorders();

        // Update on scroll and resize
        $sidebar.on('scroll', updateBorders);
        $(window).on('resize', updateBorders);
    });

    function toggleTheme() {
        const themeLink = document.getElementById("theme-stylesheet");
        if (themeLink.getAttribute("href") === "%root_path%assets/css/bootstrap.css") {
            themeLink.setAttribute("href", "%root_path%assets/css/bootstrap-dark.css");
            document.getElementById('themeToggle').textContent = '☀️';
            localStorage.setItem('theme', 'dark');
        } else {
            themeLink.setAttribute("href", "%root_path%assets/css/bootstrap.css");
            document.getElementById('themeToggle').textContent = '🌙';
            localStorage.setItem('theme', 'light');
        }
    }

    // Apply saved theme on load
    window.addEventListener('DOMContentLoaded', () => {
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'dark') {
            toggleTheme();
        }
    });

    // add previous and next links based on diary.html
    $(function () {
      const indexUrl = '/diary/diary.html';
      const currentPage = location.pathname.split('/').pop();

      // Regex to match 4 digits - 2 digits - 2 digits + ".html"
      if (!/^\d{4}-\d{2}-\d{2}\.html$/.test(currentPage)) {
        return; // Not a diary entry page, exit early
      }

      $.get(indexUrl, function (data) {
        const $html = $('<div>').html(data);

        // Get all day entry <a> elements from the index
        const $links = $html.find('#content a[href$=".html"]').filter(function () {
          return !this.href.includes('#');
        });

        const hrefs = $links.map((i, a) => $(a).attr('href')).get();
        const index = hrefs.indexOf(currentPage);

        if (index === -1) return;

        const prevHref = hrefs[index + 1] || null;
        const nextHref = hrefs[index - 1] || null;
        const lastHref = hrefs[0] !== currentPage ? hrefs[0] : null;
        const firstHref = hrefs[hrefs.length - 1] !== currentPage ? hrefs[hrefs.length - 1] : null;

        const $nav = $('<div class="diary-nav" style="margin: 2em 0; display: flex; justify-content: space-between; font-size: 1.2em;"></div>');

        const $left = $('<div class="nav-left"></div>');
        const $right = $('<div class="nav-right"></div>');

        if (firstHref) $left.append(`<a href="${firstHref}" title="First Entry">⏮️ First (${firstHref.replace('.html', '')})</a> `);
        if (prevHref)  $left.append(`<a href="${prevHref}" title="Previous Entry">⬅️ Previous (${prevHref.replace('.html', '')})</a>`);

        if (nextHref)  $right.append(`<a href="${nextHref}" title="Next Entry">Next (${nextHref.replace('.html', '')}) ➡️</a> `);
        if (lastHref)  $right.append(`<a href="${lastHref}" title="Last Entry">Last (${lastHref.replace('.html', '')}) ⏭️</a>`);

        $nav.append($left).append($right);

        $('#content').prepend($nav.clone(true));
        $('#content').append($nav.clone(true));

        // Optional: Keyboard shortcuts
        $(document).on('keydown', function (e) {
          if ($(e.target).is('input, textarea')) return;

          // Left arrow (←)
          if (e.key === 'ArrowLeft' && prevHref) {
            window.location.href = prevHref;
          }

          // Right arrow (→)
          if (e.key === 'ArrowRight' && nextHref) {
            window.location.href = nextHref;
          }

          // Home key (⤒)
          if (e.key === 'Home' && firstHref) {
            window.location.href = firstHref;
          }

          // End key (⤓)
          if (e.key === 'End' && lastHref) {
            window.location.href = lastHref;
          }
        });
      });

      // add (count) of 5 to make the day score easier to read
      $('p').each(function () {
        const text = $(this).text().trim();
        if (text.endsWith('out of 5 ⭐') && text.includes('★')) {
          let count = 0;

          $(this).contents().each(function () {
            if (this.nodeType === Node.TEXT_NODE) {
              const stars = this.nodeValue.match(/★/g);
              if (stars) count += stars.length;
            }
          });

          const html = $(this).html().replace(/out of 5/, `(${count}) out of 5`);
          $(this).html(html);
        }
      });
    });

    $("p").each(function() {
      var text = $(this).html().trim();

      // Only handle paragraphs that contain tree characters
      if (!/[├└│]/.test(text)) {
        return;
      }

      var lines = text.split(/<br\s*\/?>|\n/);

      // Root UL
      var $root = $("<ul class='tree'></ul>");
      var stack = [ {depth: 0, ul: $root} ];

      $.each(lines, function(_, line) {
        if (!line.trim()) return;

        // Count indentation level (each "│   " or 4 spaces = one level)
        var match = line.match(/^([│\s]+)/);
        var indent = match ? match[0] : "";
        var depth = Math.floor(indent.replace(/│/g, "    ").length / 4);

        // Strip leading tree characters
        line = line.replace(/&nbsp;/g, " ");
        var clean = line.replace(/^[\s\u00A0\u2500-\u257F]+/g, "");

        // Ensure stack has correct depth
        while (stack.length > depth + 1) stack.pop();
        if (stack.length < depth + 1) {
          // Create intermediate ULs if missing
          var parent = stack[stack.length-1].ul;
          var $newul = $("<ul></ul>");
          parent.children("li").last().append($newul);
          stack.push({depth: depth, ul: $newul});
        }

        // Add LI to current depth UL
        stack[stack.length-1].ul.append($("<li></li>").html(clean));
      });
      $(this).replaceWith($root);
    });

    if (document.title === 'tags') {
      // Create the tag cloud container
      var $cloudDiv = $('<div id="tag-cloud-container" style="width: 800px; height: 400px;"></div>');

      // Insert it after the #tags element, inside #content
      $('#content div#Tags').after($cloudDiv);

      // 1. Extract tags and counts from the HTML
      var tags = [];
      $("div[id^='Tags-']").each(function() {
          var $div = $(this);
          var tagName = $div.find("h2 a").text();
          var count = $div.next("ul").find("li").length;
          tags.push({ text: tagName, size: count });
      });

      // 2. Scale font sizes
      var counts = tags.map(function(t) { return t.size; });
      var minCount = Math.min.apply(null, counts);
      var maxCount = Math.max.apply(null, counts);
      var minFont = 15, maxFont = 80;

      $.each(tags, function(i, tag) {
        tag.size = minFont + (tag.size - minCount) / (maxCount - minCount || 1) * (maxFont - minFont);
      });

      // 3. Setup the cloud layout
      var layout = d3.layout.cloud()
        .size([800, 400])
        .words(tags)
        .padding(5)
        .rotate(function() { return Math.random() < 0.5 ? 0 : 90; })
        .font("Impact")
        .fontSize(function(d) { return d.size; })
        .on("end", draw);

      layout.start();

      // 4. Draw function
      function draw(words) {
        var svg = d3.select("#tag-cloud-container").append("svg")
          .attr("width", layout.size()[0])
          .attr("height", layout.size()[1]);

        var g = svg.append("g")
          .attr("transform", "translate(" + layout.size()[0]/2 + "," + layout.size()[1]/2 + ")");

        g.selectAll("text")
          .data(words)
          .enter()
          .append("a") // append an anchor
          .attr("xlink:href", d => "#tags-" + d.text)
          .append("text")
          .style("font-size", function(d){ return d.size + "px"; })
          .style("font-family", "Impact")
          .style("fill", function(){ return d3.schemeCategory10[Math.floor(Math.random()*10)]; })
          .attr("text-anchor", "middle")
          .attr("transform", function(d){ return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")"; })
          .text(function(d){ return d.text; })
          .style("cursor", "pointer")
          .on("click", function(event, d){
            window.location.href = "#tags-" + d.text;
          });
       }
    }

    $('pre code:not(.mermaid)').each(function() {
        $(this).html('<code>'+$(this).html()+'</code>');
    });
    hljs.initHighlightingOnLoad();

    // Initialize Mermaid with proper configuration
    mermaid.initialize({
        startOnLoad: false,  // Changed to false for manual control
        theme: 'default',
        themeVariables: {
            primaryColor: '#fff',
            primaryTextColor: '#333',
            primaryBorderColor: '#333',
            lineColor: '#333',
            arrowheadColor: '#333'
        },
        flowchart: {
            useMaxWidth: true,
            htmlLabels: true,
            curve: 'basis'
        },
        sequence: {
            diagramMarginX: 50,
            diagramMarginY: 10,
            actorMargin: 50,
            width: 150,
            height: 65,
            boxMargin: 10,
            boxTextMargin: 5,
            noteMargin: 10,
            messageMargin: 35,
            mirrorActors: true,
            bottomMarginAdj: 1,
            useMaxWidth: true
        }
    });

    // Manually process Mermaid diagrams on DOM ready
    $(document).ready(function() {
        // Process existing mermaid elements
        $('.mermaid').each(function(index, element) {
            try {
                mermaid.init(undefined, element);
            } catch (e) {
                console.error('Mermaid rendering error:', e);
                console.log('Element content:', element.textContent);
            }
        });
    });
</script>
</body>
</html>
