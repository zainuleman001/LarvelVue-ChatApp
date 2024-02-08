<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Static Template</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
</head>

<body
    style="
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: #ffffff;
      font-size: 14px;
    ">
    <div
        style="
        max-width: 680px;
        margin: 0 auto;
        padding: 45px 30px 60px;
        background: #f4f7ff;
        background-image: url({{asset('assets/images/banner-shape.png')}});
        background-repeat: no-repeat;
        background-size: 800px 452px;
        background-position: top center;
        font-size: 14px;
        color: #434343;
      ">
        <header>
            <table style="width: 100%;">
                <tbody>
                    <tr style="height: 0;">
                        <td>
                            <img alt="" src="{{ asset('assets/uploads/logo/logo.png') }}" height="50px" />
                        </td>
                        <td style="text-align: right;">
                            <span style="font-size: 19px; line-height: 30px; color: black;">
                                @php
                                    $timestamp = strtotime($user->updated_at);
                                    $outputDate = date('d M, Y', $timestamp);
                                @endphp
                                {{ $outputDate }}
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </header>

        <main>
            <div
                style="
            margin: 0;
            margin-top: 70px;
            padding: 92px 30px 115px;
            background: #ffffff;
            border-radius: 30px;
            text-align: center;
          ">
                <div style="width: 100%; max-width: 489px; margin: 0 auto;">

                    <p
                        style="
                margin: 0;
                margin-top: 17px;
                font-size: 16px;
                font-weight: 500;
              ">
                        Hey {{ $user->name }},
                    </p>
                    <p
                        style="
                margin: 0;
                margin-top: 17px;
                font-weight: 500;
                letter-spacing: 0.56px;
              ">
                        Thank you for choosing SL Power Washing. Use the following OTP
                        to complete the procedure to verify your email address.
                        Do not share this code with others, including SL Power Washing
                        employees.
                    </p>
                    <h1
                        style="
                margin: 0;
                font-size: 24px;
                font-weight: 500;
                color: #1f1f1f;
                margin-top: 60px;
                margin-bottom: 20px;
              ">
                        Your OTP is:
                    </h1>
                    <p
                        style="
                margin: 0;

                font-size: 40px;
                font-weight: 600;
                letter-spacing: 25px;
                color: #ba3d4f;
              ">
                        {{ $verificationCode }}
                    </p>
                </div>
            </div>

            <p
                style="
            max-width: 400px;
            margin: 0 auto;
            margin-top: 90px;
            text-align: center;
            font-weight: 500;
            color: #8c8c8c;
          ">
                Need help? Ask at
                <a href="mailto:info@slpowerwashing.com"
                    style="color: #499fb6; text-decoration: none;">info@slpowerwashing.com</a>
            </p>
        </main>

        <footer
            style="
          width: 100%;
          max-width: 490px;
          margin: 20px auto 0;
          text-align: center;
          border-top: 1px solid #e6ebf1;
        ">
            <p
                style="
            margin: 0;
            margin-top: 40px;
            font-size: 16px;
            font-weight: 600;
            color: #434343;
          ">
                SL Power Washing
            </p>
            <p style="margin: 0; margin-top: 8px; color: #434343;">
                Address 540, City, State.
            </p>
            <div style="margin: 0; margin-top: 16px;">
                <a href="{{ URL::to('/') }}" target="_blank" style="display: inline-block;">
                    <img width="36px" alt="Facebook"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661502815169_682499/email-template-icon-facebook" />
                </a>
                <a href="{{ URL::to('/') }}" target="_blank" style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Instagram"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661504218208_684135/email-template-icon-instagram" />
                </a>
                <a href="{{ URL::to('/') }}" target="_blank" style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Twitter"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503043040_372004/email-template-icon-twitter" />
                </a>
                <a href="{{ URL::to('/') }}" target="_blank" style="display: inline-block; margin-left: 8px;">
                    <img width="36px" alt="Youtube"
                        src="https://archisketch-resources.s3.ap-northeast-2.amazonaws.com/vrstyler/1661503195931_210869/email-template-icon-youtube" />
                </a>
            </div>
            <p style="margin: 0; margin-top: 16px; color: #434343;">
                Copyright © {{ date('Y') }} SL Power Washing. All rights reserved.
            </p>
        </footer>
    </div>
</body>

</html>
