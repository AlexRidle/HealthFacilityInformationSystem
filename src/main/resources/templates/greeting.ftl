<#import "parts/common.ftl" as c>

<@c.page>
    <link rel="stylesheet" href="/static/css/style.css">
    <div id="myContainer" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myContainer" data-slide-to="0" class="active"></li>
            <li data-target="#myContainer" data-slide-to="1"></li>
            <li data-target="#myContainer" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/img/banner1.jpg" class="d-block w-100" alt="facility">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Some information</h1>
                        <p class="carousel-text-shadow">Some information but smaller</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banner2.jpg" class="d-block w-100" alt="technologies">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Some information 2</h1>
                        <p class="carousel-text-shadow">Some information but smaller 2</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banner3.jpg" class="d-block w-100" alt="equipment">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Some information 3</h1>
                        <p class="carousel-text-shadow">Some information but smaller 3</p>
                        <h2><a class="btn btn-lg btn-light" href="main" role="button">Intrigue button</a></h2>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myContainer" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myContainer" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Some info</h2>
                <p>Information about something</p>
                <p><a class="btn btn-secondary" href="#" role="button">Link on it »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Some info 2</h2>
                <p>Information about something 2</p>
                <p><a class="btn btn-secondary" href="#" role="button">Link on it »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Some info 3</h2>
                <p>Information about something 3</p>
                <p><a class="btn btn-secondary" href="#" role="button">Link on it »</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Some info about <span
                        class="text-muted">something</span>.</h2>
                <p class="lead">Description about this awesome thing</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Some info about <span
                        class="text-muted">another thing</span>.</h2>
                <p class="lead">Description about another awesome thing</p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Some info about <span
                        class="text-muted">3rd thing</span>.</h2>
                <p class="lead">Description about it</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img-lg bd-placeholder-img featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div>
    <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>© 2019 Company, Inc. · <a href="#">Contacts</a> · <a href="#">Something</a></p>
    </footer>
</@c.page>