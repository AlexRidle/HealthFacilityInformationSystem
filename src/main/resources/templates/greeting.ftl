<#import "parts/common.ftl" as c>

<@c.page>
    <div id="myContainer" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/img/banner1.jpg" class="d-block w-100" alt="oborudovanie">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Новейшее оборудование</h1>
                        <p class="carousel-text-shadow">сдали в ломбард</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banner2.jpg" class="d-block w-100" alt="stil">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Удобное расположение</h1>
                        <p class="carousel-text-shadow">уже не помню где</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banner3.jpg" class="d-block w-100" alt="registraciya">
                <div class="carousel-caption text-right">
                    <h1 class="carousel-text-shadow">Еще не передумал?</h1>
                    <p class="carousel-text-shadow">Тогда скорее заказывай талон!</p>
                    <h2><a class="btn btn-lg btn-light" href="main" role="button">Заказать сейчас</a></h2>
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
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Диплом</h2>
                <p>Чет я приуныл это делать, скорее бы его сдать.</p>
                <p><a class="btn btn-secondary" href="#" role="button">Сдать диплом »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Курсач</h2>
                <p>Как я их сдавал это какая-то загадка.</p>
                <p><a class="btn btn-secondary" href="#" role="button">Разгадать »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140"
                     xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                     role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text>
                </svg>
                <h2>Идеи</h2>
                <p>Они у меня закончились, что сюда можно написать.</p>
                <p><a class="btn btn-secondary" href="#" role="button">Добавить »</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">ЖКХ годами <span
                        class="text-muted">УМАЛЧИВАЛ</span></h2>
                <p class="lead">об этом простом способе ЭКОНОМИИ воды...</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Хитрый способ <span
                        class="text-muted">бросить курить.</span></h2>
                <p class="lead">Боярский курил 50 лет, бросил за 3 дня!</p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee"></rect>
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
                </svg>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Шокирующее <span
                        class="text-muted">ВИДЕО</span>!</h2>
                <p class="lead">Могила ленина крутится с околосветовой скоростью и питает током всю Россию!</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img-lg bd-placeholder-img featurette-image img-fluid mx-auto" width="500"
                     height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                     focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title>
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
        <p>© 2017-2019 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
    </footer>
</@c.page>