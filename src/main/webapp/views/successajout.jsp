<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success Message</title>
    <style>
        .success-message {
            text-align: center;
            max-width: 500px;
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .success-message__icon {
            max-width: 150px;
        }

        .success-message__title {
            color: #5dacbd;
            transform: translateY(25px);
            opacity: 0;
            transition: all 1000ms ease;
        }

        .active .success-message__title {
            transform: translateY(0);
            opacity: 1;
        }

        .success-message__content {
            color: #222;
            transform: translateY(250px);
            opacity: 0;
            transition: all 1000ms ease;
            transition-delay: 50ms;
        }

        .success-message__content a {
            color: #5dacbd;
            text-decoration: none;
        }

        .active .success-message__content {
            transform: translateY(0);
            opacity: 1;
        }

        .icon-checkmark circle {
            fill: #5dacbd;
            transform-origin: 50% 50%;
            transform: scale(0);
            transition: transform 1000ms cubic-bezier(0.22, 0.96, 0.38, 0.98);
        }

        .icon-checkmark path {
            transition: stroke-dashoffset 350ms ease;
            transition-delay: 100ms;
        }

        .active .icon-checkmark circle {
            transform: scale(1);
        }
    </style>
</head>
<body>
    <div class="success-message">
        <svg viewBox="0 0 76 76" class="success-message__icon icon-checkmark">
            <circle cx="38" cy="38" r="36"/>
            <path fill="none" stroke="#FFFFFF" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="M17.7,40.9l10.9,10.9l28.7-28.7"/>
        </svg>
        <h1 class="success-message__title">Document uploaded successfully</h1>
        <div class="success-message__content">
            <p>success</p>
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