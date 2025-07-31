/*!
 * Copyright (c) Microsoft Corporation and contributors. All rights reserved.
 * Licensed under the MIT License.
 */

import { Lumberjack } from "@fluidframework/server-services-telemetry";
import type { RequestHandler } from "express";

/**
 * Middleware to log response bodies for debugging purposes
 */
export const responseLoggingMiddleware = (): RequestHandler => {
	return (req, res, next) => {
		const originalSend = res.send;

		res.send = function(body) {
			// Log the response body with context
			Lumberjack.info("GitRest Response Body", {
				url: req.url,
				method: req.method,
				statusCode: res.statusCode,
				bodyType: typeof body,
				bodyLength: body ? (typeof body === "string" ? body.length : JSON.stringify(body).length) : 0,
				body
			});

			return originalSend.call(this, body);
		};

		next();
	};
};
