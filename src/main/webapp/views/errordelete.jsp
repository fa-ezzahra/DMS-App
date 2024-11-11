<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Message</title>
    <style>
        .error-message {
            text-align: center;
            max-width: 500px;
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .error-message__icon {
            max-width: 150px;
        }

        .error-message__title {
            color: #e74c3c;
            transform: translateY(25px);
            opacity: 0;
            transition: all 1000ms ease;
        }

        .active .error-message__title {
            transform: translateY(0);
            opacity: 1;
        }

        .error-message__content {
            color: #222;
            transform: translateY(250px);
            opacity: 0;
            transition: all 1000ms ease;
            transition-delay: 50ms;
        }

        .error-message__content a {
            color: #e74c3c;
            text-decoration: none;
        }

        .active .error-message__content {
            transform: translateY(0);
            opacity: 1;
        }

        .icon-cross circle {
            fill: #e74c3c;
            transform-origin: 50% 50%;
            transform: scale(0);
            transition: transform 1000ms cubic-bezier(0.22, 0.96, 0.38, 0.98);
        }

        .icon-cross path {
            transition: stroke-dashoffset 350ms ease;
            transition-delay: 100ms;
        }

        .active .icon-cross circle {
            transform: scale(1);
        }
    </style>
</head>
<body>
    <div class="error-message">
        <svg viewBox="0 0 76 76" class="error-message__icon icon-cross">
            <circle cx="38" cy="38" r="36"/>
            <path fill="none" stroke="#FFFFFF" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="M25,25 L51,51 M51,25 L25,51"/>
        </svg>
        <h1 class="error-message__title">Error</h1>
        <div class="error-message__content">
            <p>Ce Document n'existe pas ou n'est pas le votre</p>
            <p>Head back to <a href="index.html">home</a></p>
        </div>
    </div>

    <script>
        function PathLoader(el) {
            this.el = el;
            this.strokeLength = el.getTotalLength();

            // set dash offset to 0
            this.el.style.strokeDasharray =
                this.el.style.strokeDashoffset = this.strokeLength;
        }

        PathLoader.prototype._draw = function(val) {
            this.el.style.strokeDashoffset = this.strokeLength * (1 - val);
        }

        PathLoader.prototype.setProgress = function(val, cb) {
            this._draw(val);
            if (cb && typeof cb === 'function') cb();
        }

        PathLoader.prototype.setProgressFn = function(fn) {
            if (typeof fn === 'function') fn(this);
        }

        var body = document.body,
            svg = document.querySelector('svg path');

        if (svg !== null) {
            svg = new PathLoader(svg);

            setTimeout(function() {
                document.body.classList.add('active');
                svg.setProgress(1);
            }, 400);
        }

        document.addEventListener('click', function() {

            if (document.body.classList.contains('active')) {
                document.body.classList.remove('active');
                svg.setProgress(0);
                return;
            }
            document.body.classList.add('active');
            svg.setProgress(1);
        });
    </script>
</body>
</html>