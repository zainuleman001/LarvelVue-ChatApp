<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Sl Power Washing</title>

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
        background-image: url({{ asset('assets/images/banner-shape.png') }});
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
                            <a href="{{ URL::to('/') }}"><img alt=""
                                    src="{{ asset('assets/uploads/logo/logo.png') }}" height="50px" /></a>
                        </td>
                        <td style="text-align: right;">
                            <span style="font-size: 19px; line-height: 30px; color: black;">
                                @php
                                    $currentTimestamp = time();
                                    $outputDate = date('d M, Y', $currentTimestamp);
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
            padding: 30px 30px 115px;
            background: #ffffff;
            border-radius: 30px;
            text-align: center;
          ">
                <div style="width: 100%;">
                    <p
                        style="
                margin: 17px 0px;
                font-weight: 500;
                letter-spacing: 0.56px;
              ">
                        SL Power Washing Booking Detail
                    </p>
                </div>
                <table cellpadding="0" cellspacing="0" border="1" style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <th style="background-color: #f0f0f0; text-align: left; padding: 8px;">Field</th>
                        <th style="background-color: #f0f0f0; text-align: left; padding: 8px;">Value</th>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Name</td>
                        <td style="text-align: left; padding: 8px;">{{$data['name']}}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Email</td>
                        <td style="text-align: left; padding: 8px;">{{$data['email']}}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Phone Number</td>
                        <td style="text-align: left; padding: 8px;">{{$data['number']}}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Service</td>
                        <td style="text-align: left; padding: 8px;">{{$service['title']}}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Package</td>
                        <td style="text-align: left; padding: 8px;">{{$pricePlan['subscription_title']}}</td>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding: 8px;">Message</td>
                        <td style="text-align: left; padding: 8px;">{{$data['message']}}</td>
                    </tr>
                </table>

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
