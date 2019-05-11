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
                <img src="/img/banners/banner1.jpg" class="d-block w-100" alt="facility">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">На службе вашего здоровья</h1>
                        <p class="carousel-text-shadow">Мы гарантируем Вам качество обслуживания и внимание к каждому клиенту! </p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banners/banner2.jpg" class="d-block w-100" alt="technologies">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Расширение возможностей!</h1>
                        <p class="carousel-text-shadow">Теперь у Вас появилась возможность заказать талон онлайн за считанные минуты!</p>
                        <h2><a class="btn btn-lg btn-outline-light" href="ticket" role="button">Заказать талон</a></h2>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/img/banners/banner3.jpg" class="d-block w-100" alt="equipment">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption text-right">
                        <h1 class="carousel-text-shadow">Мы постоянно совершенствуемся! </h1>
                        <p class="carousel-text-shadow">Мы заинтересованы в высоком уровне обслуживания. Присылайте свои предложения и пожелания по адресу support@healthfacility.com или зарегистрируйтесь и оставьте их на сайте</p>
                        <h2><a class="btn btn-lg btn-outline-dark" href="support" role="button">Оставить отзыв</a></h2>

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
                <img src="/img/150x150/ticket.jpg" class="d-block rounded-img-150" alt="ticket">
                <h2>Талон онлайн</h2>
                <p>Закажите талон прямо сейчас не выходя из дома</p>
                <p><a class="btn btn-secondary" href="/ticket" role="button">Записаться »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="/img/150x150/news.jpg" class="d-block rounded-img-150" alt="news">
                <h2>Свежие новости</h2>
                <p>Будьте в курсе актуальных событий нашего учреждения</p>
                <p><a class="btn btn-secondary" href="/news" role="button">Прочитать »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="/img/150x150/account.jpg" class="d-block rounded-img-150" alt="account">
                <h2>Личный аккаунт</h2>
                <p>Получите доступ к расширенному функционалу сайта</p>
                <p><a class="btn btn-secondary" href="/registration" role="button">Зарегистрироваться »</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Новейшее оборудование</h2>
                <p class="lead">В нашем учреждении используется современное оборудование, дающее возможность проведения сложных обследований.
                    Мы следим за выходом новинок на рынке медицинского оборудования,
                    пополняем наличие техники исключительно высококачественными приборами и устройсвами,
                    а также поддерживаем их исправность и работу на высоком уровне</p>
            </div>
            <div class="col-md-5">
                <img src="/img/500x500/equipment.jpg" class="d-block w-100" alt="equipment">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Квалифицированный персонал</h2>
                <p class="lead">Наш медицинский персонал состоит исключительно из высококлассных специалистов.
                    Несмотря на высшую степень образования, наши врачи постоянно совершенствуются,
                    проходя курсы повышения квалификации и участвуя в различных конференциях. </p>
            </div>
            <div class="col-md-5 order-md-1">
                <img src="/img/500x500/doctors.jpg" class="d-block w-100" alt="doctors">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Современные методы лечения</h2>
                <p class="lead">Благодаря высококлассным специалистам и современному оборудрованию,
                    нам удается применять самые современные методы лечения,
                    которые признаны во всех высокоразвитых странах.
                    Эта возможность позволяет оказывать качественную помощь нашим клиентам</p>
            </div>
            <div class="col-md-5">
                <img src="/img/500x500/methods.jpg" class="d-block w-100" alt="methods">
            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div>
    <footer class="container">
        <p class="float-right"><a href="#">К началу страницы</a></p>
        <p>© 2019 Health Facility · <a href="/contacts">Контакты</a> · <a href="/about">О нас</a></p>
    </footer>
</@c.page>