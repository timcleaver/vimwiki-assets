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
</style>


<script type="text/javascript" src="%root_path%assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="%root_path%assets/js/jquery-migrate-3.4.1.min.js"></script>

<script type="text/javascript" src="%root_path%assets/js/bootstrap-2.3.0.js"></script>
<script type="text/javascript" src="%root_path%assets/js/highlight.pack.js"></script>

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
                        <a href="%root_path%flight_centre.glossary.html">Flight Centre Glossary</a>
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
                $submenu.slideToggle(200);
                const $icon = $(this).find('i');
                $icon.toggleClass('fa-chevron-right fa-chevron-down');
            });

            <!-- replace date only links with emoji with calculated dates -->
            $('a').filter(function() {
                return /([0-9]{4}-[0-9]{2}-[0-9]{2})\s*(\u{1F5D3}\u{FE0F}?|\u{1F4C5})/u.test($(this).text());
            }).each(function() {
                console.log($(this).text());
                console.log($(this).html())
                $(this).html($(this).html().replace(/([0-9]{4}-[0-9]{2}-[0-9]{2})\s*(\u{1F5D3}\u{FE0F}?|\u{1F4C5})/ug, function(match, group1) {
                    console.log($(this).text());
                    console.log(match);
                    console.log(group1);
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

    $('pre').each(function() {
        $(this).html('<code>'+$(this).html()+'</code>');
    });
    hljs.initHighlightingOnLoad();
</script>
</body>
</html>
